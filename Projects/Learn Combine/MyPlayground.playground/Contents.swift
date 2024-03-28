import Cocoa
import Combine

var greeting = "Hello, playground"
//
var subscriptions = Set<AnyCancellable>()

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}

example(of: "Publisher") {
  // 1
  let myNotification = Notification.Name("MyNotification")

  // 2
  let publisher = NotificationCenter.default
    .publisher(for: myNotification, object: nil)
    // 3
    let center = NotificationCenter.default

    // 4
    let observer = center.addObserver(
      forName: myNotification,
      object: nil,
      queue: nil) { notification in
        print("Notification received!")
    }
    
    // 5
    center.post(name: myNotification, object: nil)

    // 6
    center.removeObserver(observer)
}

example(of: "Subscriber") {
  let myNotification = Notification.Name("MyNotification")

  let publisher = NotificationCenter.default
    .publisher(for: myNotification, object: nil)

  let center = NotificationCenter.default
    // 1
    let subscription = publisher
      .sink { _ in
        print("Notification received from a publisher!")
      }

    // 2
    center.post(name: myNotification, object: nil)
    // 3
    subscription.cancel()
}

example(of: "Just") {
  // 1
  let just = Just("Hello world!")
  
  // 2
  _ = just
    .sink(
      receiveCompletion: {
        print("Received completion", $0)
      },
      receiveValue: {
        print("Received value", $0)
    })
    _ = just
      .sink(
        receiveCompletion: {
          print("Received completion (another)", $0)
        },
        receiveValue: {
          print("Received value (another)", $0)
      })
}

example(of: "assign(to:on:)") {
  // 1
  class SomeObject {
    var value: String = "" {
      didSet {
        print(value)
      }
    }
  }
  
  // 2
  let object = SomeObject()
  
  // 3
  let publisher = ["Hello", "world!"].publisher
  
  // 4
  _ = publisher
    .assign(to: \.value, on: object)
}
example(of: "assign(to:)") {
  // 1
  class SomeObject {
    @Published var value = 0
  }
  
  let object = SomeObject()
  
  // 2
  object.$value
    .sink {
      print($0)
    }
  
  // 3
  (0..<10).publisher
    .assign(to: &object.$value)
}




example(of: "Custom Subscriber") {
  // 1
  let publisher = (1...6).publisher
  
  // 2
  final class IntSubscriber: Subscriber {
    // 3
    typealias Input = Int
    typealias Failure = Never

    // 4
    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }
    
    // 5
    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      return .none
    }
    
    // 6
    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
    let subscriber = IntSubscriber()

    publisher.subscribe(subscriber)
}
/**
example(of: "Future") {
  func futureIncrement(
    integer: Int,
    afterDelay delay: TimeInterval) -> Future<Int, Never> {
        return Future<Int, Never> { promise in
          DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
              print("Original")
            promise(.success(integer + 1))
          }
        }
  }
    // 1
    let future = futureIncrement(integer: 1, afterDelay: 1)

    // 2
    future
      .sink(receiveCompletion: { print($0) },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
    
    future
      .sink(receiveCompletion: { print("Second", $0) },
            receiveValue: { print("Second", $0) })
      .store(in: &subscriptions)
} */

example(of: "PassthroughSubject") {
  // 1
  enum MyError: Error {
    case test
  }
  
  // 2
  final class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
      print("Received value", input)
      // 3
      return input == "World" ? .max(1) : .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
      print("Received completion", completion)
    }
  }
  
  // 4
  let subscriber = StringSubscriber()
    
  // 5
  let subject = PassthroughSubject<String, MyError>()

  // 6
  subject.subscribe(subscriber)

  // 7
  let subscription = subject
      .sink(
        receiveCompletion: { completion in
          print("Received completion (sink)", completion)
        },
        receiveValue: { value in
          print("Received value (sink)", value)
        }
      )
    subject.send("Hello")
    subject.send("World")
    // 8
    subscription.cancel()

    // 9
    subject.send("Still there?")
    
    subject.send(completion: .failure(MyError.test))
    subject.send(completion: .finished)
    subject.send("How about another one?")
}

example(of: "CurrentValueSubject") {
  // 1
  var subscriptions = Set<AnyCancellable>()
  
  // 2
  let subject = CurrentValueSubject<Int, Never>(0)
  
  // 3
  subject
        .print()
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions) // 4
    
    subject.send(1)
    subject.send(2)
    print(subject.value)
    subject.value = 3
    print(subject.value)
    subject
        .print()
      .sink(receiveValue: { print("Second subscription:", $0) })
      .store(in: &subscriptions)
    subject.send(completion: .finished)
}

example(of: "Dynamically adjusting Demand") {
  final class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      
      switch input {
      case 1:
        return .max(2) // 1
      case 3:
        return .max(1) // 2
      default:
        return .none // 3
      }
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
  
  let subscriber = IntSubscriber()
  
  let subject = PassthroughSubject<Int, Never>()
  
  subject.subscribe(subscriber)
  
  subject.send(1)
  subject.send(2)
  subject.send(3)
  subject.send(4)
  subject.send(5)
  subject.send(6)
}


example(of: "Type erasure") {
  // 1
  let subject = PassthroughSubject<Int, Never>()
  
  // 2
  let publisher = subject.eraseToAnyPublisher()
  
  // 3
  publisher
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
  
  // 4
  subject.send(0)
//    publisher.send(1)
}
