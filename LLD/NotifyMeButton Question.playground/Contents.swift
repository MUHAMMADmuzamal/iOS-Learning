import Cocoa

var greeting = "Hello, playground"

protocol SubscriberProtocol {
    var id: String {get}
    func update(value: String)
}

class Client: SubscriberProtocol, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    init(name: String) {
        self.name = name
    }
    func update(value: String) {
        print("\(self.name) - \(value)")
    }
}

class NotificationManager {
    var subscribers :[SubscriberProtocol] = []
    
    func addSubscriber(_ subscriber: SubscriberProtocol) {
        self.subscribers.append(subscriber)
    }
    func addSubscriber(_ subscriber: [SubscriberProtocol]) {
        self.subscribers.append(contentsOf: subscriber)
    }
    
    func removeSubscriber(_ subscriber: SubscriberProtocol) {
        self.subscribers.removeAll(where: {$0.id == subscriber.id})
    }
    
    func notifySubscriber(value: String) {
        for sub in self.subscribers {
            sub.update(value: value)
        }
    }
}

let manager: NotificationManager = NotificationManager()
let client1 = Client(name: "Client-1")
let client2 = Client(name: "Client-2")
let client3 = Client(name: "Client-3")
let client4 = Client(name: "Client-4")
let client5 = Client(name: "Client-5")

manager.addSubscriber([client1, client2, client3, client4, client5])
manager.notifySubscriber(value: "New Product IPhone lunched.")
//MARK:
// i learned that observer pattern is use when i need to observe a thing and update different
// classes or do different things like send message through mail, push notifications etc.
