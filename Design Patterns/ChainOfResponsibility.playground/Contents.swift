import Cocoa

var greeting = "Hello, playground"

//protocol Handler {
//    var nextHandler: Handler? { get set }
//    func handle(request: String)
//}
//
//class ConcreteHandler1: Handler {
//    var nextHandler: Handler?
//
//    func handle(request: String) {
//        if request == "request1" {
//            print("ConcreteHandler1 handles request1")
//        } else {
//            nextHandler?.handle(request: request)
//        }
//    }
//}
//
//class ConcreteHandler2: Handler {
//    var nextHandler: Handler?
//
//    func handle(request: String) {
//        if request == "request2" {
//            print("ConcreteHandler2 handles request2")
//        } else {
//            nextHandler?.handle(request: request)
//        }
//    }
//}
//
//class ConcreteHandler3: Handler {
//    var nextHandler: Handler?
//
//    func handle(request: String) {
//        if request == "request3" {
//            print("ConcreteHandler3 handles request3")
//        } else {
//            print("End of chain, no handler for \(request)")
//        }
//    }
//}
//
//let handler1 = ConcreteHandler1()
//let handler2 = ConcreteHandler2()
//let handler3 = ConcreteHandler3()
//
//handler1.nextHandler = handler2
//handler2.nextHandler = handler3
//
//handler1.handle(request: "request1") // Output: ConcreteHandler1 handles request1
//handler1.handle(request: "request2") // Output: ConcreteHandler2 handles request2
//handler1.handle(request: "request3") // Output: ConcreteHandler3 handles request3
//handler1.handle(request: "unknown")  // Output: End of chain, no handler for unknown



protocol Handler: AnyObject {

    @discardableResult
    func setNext(handler: Handler) -> Handler

    func handle(request: String) -> String?

    var nextHandler: Handler? { get set }
}

extension Handler {

    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler

        /// Returning a handler from here will let us link handlers in a
        /// convenient way like this:
        /// monkey.setNext(handler: squirrel).setNext(handler: dog)
        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
}

/// All Concrete Handlers either handle a request or pass it to the next handler
/// in the chain.
class MonkeyHandler: Handler {

    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if (request == "Banana") {
            return "Monkey: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class SquirrelHandler: Handler {

    var nextHandler: Handler?

    func handle(request: String) -> String? {

        if (request == "Nut") {
            return "Squirrel: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class DogHandler: Handler {

    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if (request == "MeatBall") {
            return "Dog: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

/// The client code is usually suited to work with a single handler. In most
/// cases, it is not even aware that the handler is part of a chain.
class Client {
    // ...
    static func someClientCode(handler: Handler) {

        let food = ["Nut", "Banana", "Cup of coffee"]

        for item in food {

            print("Client: Who wants a " + item + "?\n")

            guard let result = handler.handle(request: item) else {
                print("  " + item + " was left untouched.\n")
                return
            }

            print("  " + result)
        }
    }
    // ...
}

/// Let's see how it all works together.
class ChainOfResponsibilityConceptual {
 
    func test() {

        /// The other part of the client code constructs the actual chain.

        let monkey = MonkeyHandler()
        let squirrel = SquirrelHandler()
        let dog = DogHandler()
        monkey.setNext(handler: squirrel).setNext(handler: dog)

        /// The client should be able to send a request to any handler, not just
        /// the first one in the chain.

        print("Chain: Monkey > Squirrel > Dog\n\n")
        Client.someClientCode(handler: monkey)
        print()
        print("Subchain: Squirrel > Dog\n\n")
        Client.someClientCode(handler: squirrel)
    }
}
let chain = ChainOfResponsibilityConceptual()
chain.test()
