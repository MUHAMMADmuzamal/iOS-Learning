import Cocoa
import PlaygroundSupport

var greeting = "Hello, playground"
PlaygroundPage.current.needsIndefiniteExecution = true

//class CustomThread {
//    func createThread() {
//        let thread: Thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
//        thread.start()
//    }
//    
//    @objc func threadSelector() {
//        print("custom thread started")
//    }
//}
//
//
//let customThread = CustomThread()
//customThread.createThread()


//var counter = 1
//DispatchQueue.main.async {
//    for i in 0...3 {
//        counter = i
//        print("\(counter)")
//    }
//}
//for i in 4...6 {
//    counter = i
//    print("\(counter)")
//}
//
//DispatchQueue.main.async {
//    counter = 9
//    print("\(counter)")
//    
//}

//DispatchQueue.main.async {
//    print(Thread.isMainThread ? "Execution on main thread": "Execution on background thread")
//}
//
//
//DispatchQueue.global(qos: .userInteractive).async {
//    print(Thread.isMainThread ? "Execution on main thread": "Execution on global concurrent thread")
//}

//DispatchQueue.global(qos: .background).async {
//    for i in 11...21 {
//        print(i)
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).async {
//    for i in 0...10 {
//        print(i)
//    }
//}

//let a = DispatchQueue(label: "A")
//let b = DispatchQueue(label: "B", attributes: .concurrent, target: a)
//
//a.async {
//    for i in 0...5 {
//        print(i)
//    }
//}
//
//a.async {
//    for i in 6...10 {
//        print(i)
//    }
//}
//
//
//b.async {
//    for i in 11...15 {
//        print(i)
//    }
//}
//
//b.async {
//    for i in 16...20 {
//        print(i)
//    }
//}


// how to change target queue after initilization

let a = DispatchQueue(label: "A")
let b = DispatchQueue(label: "B", attributes: [.concurrent, .initiallyInactive])
b.setTarget(queue: a)
b.async {
    print("Testing change target.")
}
b.activate()
