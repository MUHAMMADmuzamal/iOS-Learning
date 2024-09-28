import Cocoa
import Combine
import SwiftUI

var greeting = "Hello, playground"

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}

//MARK: understand combine using observer design pattern.
example(of: "understand combine using observer design pattern.") {
    // subject need to be observed.
    let trafficLightSubject = PassthroughSubject<Color,Never>()


    // observer that observe traffic light
    let cancellable = trafficLightSubject.sink { colour in
        switch colour {
        case .red:
            print("Stop All vehicals")
        case .yellow:
            print("start Engines")
        case .green:
            print("Allow to go")
        default:
            break
        }
    }

    // state change of subject.
    trafficLightSubject.send(.red)
    trafficLightSubject.send(.yellow)
    trafficLightSubject.send(.green)
    // stop observing.
    cancellable.cancel()
}

// MARK: Custom Publisher
extension Publishers {
    struct TrafficLightPublisher: Publisher {

        typealias Output = Color
        
        typealias Failure = Error
        
        private var state: Color
        
        init(state: Color) {
            self.state = state
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Color == S.Input {
            let subscription = TrafficLightSubscription(subscriber: subscriber, state: self.state)
            // following line add custom subscription
            subscriber.receive(subscription: subscription)
            // following line use default subscription
//            subscriber.receive(state)
        }
    }
    
    class TrafficLightSubscription<S: Subscriber>: Subscription where S.Input == Color, S.Failure == Error {
        private var subscriber: S?
        private var state: Color
        
        init(subscriber: S, state: Color) {
            self.subscriber = subscriber
            self.state = state
            self.setState()
        }
        
        func request(_ demand: Subscribers.Demand) {
            
        }
        
        func cancel() {
            subscriber = nil
        }
        
        func setState(){
            switch self.state {
            case .red,.yellow, .green :
                subscriber?.receive(self.state)
            default:
                subscriber?.receive(completion: Subscribers.Completion.failure(NSError(domain: "wrong color - \(self.state)", code: 11)))
            }
            
        }
    }
}
var cancelBag = Set<AnyCancellable>()
func updateState(color: Color) {
    Publishers.TrafficLightPublisher(state: color).sink { error in
        print("Error: ",error)
    } receiveValue: { color in
        print("Value: ", color)
    }.store(in: &cancelBag)
}

updateState(color: .red)
updateState(color: .yellow)
updateState(color: .green)
updateState(color: .blue)

//MARK: Custom Subscriber
struct TrafficLightSubscriber: Subscriber {

    
    var combineIdentifier: CombineIdentifier =  CombineIdentifier()
    
    typealias Input = Publishers.TrafficLightPublisher.Output
    
    typealias Failure = Publishers.TrafficLightPublisher.Failure
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: Publishers.TrafficLightPublisher.Output) -> Subscribers.Demand {
        print("CS- Received value", input)
        return .unlimited // if return none then not further data will be fetched.
    }
    
    func receive(completion: Subscribers.Completion<Failure>) {
        print("CS- Received completion", completion)
    }
}

print("\n——— Example of: Custom Subscriber ———")
let trafficLightSubscriber = TrafficLightSubscriber()
Publishers.TrafficLightPublisher(state: .red).subscribe(trafficLightSubscriber)
Publishers.TrafficLightPublisher(state: .green).subscribe(trafficLightSubscriber)
Publishers.TrafficLightPublisher(state: .blue).subscribe(trafficLightSubscriber)


/// latest learning examples
///

example(of: "Subscriber") {

    class IntSubscriber: Subscriber {
    
        typealias Input = Int
        
        typealias Failure = Never
        
        func receive(subscription: Subscription) {
            subscription.request(.unlimited)
        }
        
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received Inside Subscriber: \(input) ")
            return .unlimited
        }
        
        func receive(completion: Subscribers.Completion<Never>) {
            print("completion")
        }
    }
    
   let publisher =  (0...10).publisher
    let subscriber = IntSubscriber()
    publisher.subscribe(subscriber)
    
    
    enum MyError: Error {
        case test
    }
    
    class StringSubscriber: Subscriber {

        
        typealias Input = String
        
        typealias Failure = MyError
        
        func receive(subscription: Subscription) {
            subscription.request(.unlimited)
        }
        
        func receive(_ input: String) -> Subscribers.Demand {
            print("inside Receive : \(input)")
            return .unlimited
        }
        
        func receive(completion: Subscribers.Completion<MyError>) {
            print("Received completion", completion)
        }
    }
    
    let stringSubscriber = StringSubscriber()
    
    let stringSubject = PassthroughSubject<String, MyError>()
    
    stringSubject.subscribe(stringSubscriber)
    
    let subscription = stringSubject
      .sink(
        receiveCompletion: { completion in
          print("Received completion (sink)", completion)
        },
        receiveValue: { value in
          print("Received value (sink)", value)
        }
      )
    stringSubject.send("Hello")
    stringSubject.send("World")
    subscription.cancel()
    stringSubject.send("Still there?")
    stringSubject.send(completion: .failure(MyError.test))
    stringSubject.send(completion: .finished)
    stringSubject.send("How about another one?")


}

example(of: "Custom Publisher with default subscription") {
    
    
    //    class TrafficLightPublisher: Publisher {
    //
    //        typealias Output = Color
    //        typealias Failure = Error
    //
    //        private var state: Color
    //        private var subscription: TrafficLightSubscription<AnySubscriber<Color, Error>>?
    //
    //        init(state: Color) {
    //            self.state = state
    //        }
    //
    //        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
    //            let subscription = TrafficLightSubscription(subscriber: AnySubscriber(subscriber), state: self.state)
    //            self.subscription = subscription
    //            subscriber.receive(subscription: subscription)
    //        }
    //
    //        func send(_ color: Color) {
    //            if color == .red || color == .yellow || color == .green {
    //                subscription?.receive(color)
    //            } else {
    //                subscription?.receive(completion: .failure(TrafficLightError.wrongColor))
    //            }
    //        }
    //    }
    
    
//    class TrafficLightSubscription<S: Subscriber>: Subscription where S.Input == Color, S.Failure == Error {
//        private var subscriber: S?
//        private var state: Color
//        
//        init(subscriber: S, state: Color) {
//            self.subscriber = subscriber
//            self.state = state
//            self.setState()
//        }
//        
//        func request(_ demand: Subscribers.Demand) {
//            // Respond to demand here
////                  for _ in 0..<demand.max ?? 0 {
////                      _ = subscriber?.receive("Hello from CustomSubscription")
////                  }
//                  // Send completion after delivering values
////                  subscriber?.receive(completion: .finished)
//        }
//        
//        func cancel() {
//            subscriber = nil
//        }
//        
//        func setState(){
//            switch self.state {
//            case .red,.yellow, .green :
//                subscriber?.receive(self.state)
//            default:
//                subscriber?.receive(completion: Subscribers.Completion.failure(NSError(domain: "wrong color - \(self.state)", code: 11)))
//            }
//            
//        }
//    }
    
    
    // Error type
    enum TrafficLightError: Error {
        case wrongColor
    }

    // Publisher that stores value and allows sending new values
    class TrafficLightPublisher: Publisher {

        typealias Output = Color
        typealias Failure = Error

        private var state: Color
        private var subject = PassthroughSubject<Color, Error>()

        init(state: Color) {
            self.state = state
        }

        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            subject.subscribe(subscriber)
        }

        func send(_ color: Color) {
            if color == .red || color == .yellow || color == .green {
                subject.send(color)
            } else {
                subject.send(completion: .failure(TrafficLightError.wrongColor))
            }
        }
    }
        var cancelBag = Set<AnyCancellable>()

        let trafficLightPublisher = TrafficLightPublisher(state: .red)

        trafficLightPublisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error:", error)
                }
            },
            receiveValue: { color in
                print("Received value:", color)
            }
        ).store(in: &cancelBag)

        trafficLightPublisher.send(.red)
        trafficLightPublisher.send(.yellow)
        trafficLightPublisher.send(.green)
        trafficLightPublisher.send(.blue)  // This will cause an error
        trafficLightPublisher.send(.red)
    
}

