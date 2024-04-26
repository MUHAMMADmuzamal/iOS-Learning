//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Notifier {
    func send(_ message: String)
}

class fbNotifier : Notifier {
    func send(_ message: String){
        print("FB:-> \(message)")
    }
}

class gmailNotifier: Notifier {
    func send(_ message: String){
        print("GMAIL:-> \(message)")
    }
}

class slackNotifier: Notifier {
    func send(_ message: String){
        print("SLACK:-> \(message)")
    }
}

protocol NotifierDecorator: Notifier {
    var notifier: Notifier { get }
    init (notifier: Notifier)
}

class SmsNotifier: NotifierDecorator {
    var notifier: Notifier
    required init(notifier: Notifier) {
        self.notifier = notifier
    }
    
    func send(_ message: String){
        print("SMS Send{")
        self.notifier.send(message)
        print("}")
    }
}

class CallNotifier: NotifierDecorator {
    var notifier: Notifier
    required init(notifier: Notifier) {
        self.notifier = notifier
    }
    
    func send(_ message: String){
        print("Call Send{")
        self.notifier.send(message)
        print("}")
    }
}

let smsPlusFbNotifier = SmsNotifier(notifier: fbNotifier())
smsPlusFbNotifier.send("alert message")

let smsPlusGmailNotifier = SmsNotifier(notifier: gmailNotifier())
smsPlusGmailNotifier.send("alert message")


let callPlusSmsPlusGmailNotifier = CallNotifier(notifier: SmsNotifier(notifier: gmailNotifier()))
callPlusSmsPlusGmailNotifier.send("alert message")


