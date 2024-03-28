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
