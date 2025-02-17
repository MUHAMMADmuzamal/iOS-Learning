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

//let a = DispatchQueue(label: "A")
//let b = DispatchQueue(label: "B", attributes: [.concurrent, .initiallyInactive])
//b.setTarget(queue: a)
//b.async {
//    print("Testing change target.")
//}
//b.activate()


// Operation Queue

//func testOperations() {
//    let operation: BlockOperation = BlockOperation {
//        print("First test")
//        sleep(3)
//    }
//    
//    operation.start()
//}

//func testOperations() {
//    let operation: BlockOperation = BlockOperation()
//    
//    operation.completionBlock = {
//        print("Execution Complete")
//    }
//    
//    operation.addExecutionBlock {
//        print("First block execute.")
//    }   
//    
//    operation.addExecutionBlock {
//        print("Second block execute.")
//    }
//    
//    operation.addExecutionBlock {
//        print("Third block execute.")
//    }
//    DispatchQueue.global().async {
//        operation.start()
//        print("Did this run on main thread \(Thread.isMainThread)")
//    }
//    
//}
// for running operation queue on background thread this is not recommended.
//func testOperations() {
//    let operation: CustomOperation = CustomOperation()
//    operation.start()
//    print("Custom Operation")
//}
//class CustomOperation: Operation {
//    override func main() {
//        for i in 0...10 {
//            print(i)
//        }
//    }
//    
//    override func start() {
//        Thread.init(block: main).start()
//    }
//}

//func testOperations() {
//    let operationQueue: OperationQueue = OperationQueue()
////    operationQueue.maxConcurrentOperationCount = 1
//    
//    let operation1: BlockOperation = BlockOperation()
//    operation1.addExecutionBlock {
//        print("Operation 1 begin execution.")
//        for i in 0...10 {
//            print(i)
//        }
//    }
//    
//    operation1.completionBlock = {
//        print("Operation 1 done execution.")
//    }  
//    
//    let operation2: BlockOperation = BlockOperation()
//    operation2.addExecutionBlock {
//        print("Operation 2 begin execution.")
//        for i in 11...21 {
//            print(i)
//        }
//    }
//    
//    operation2.completionBlock = {
//        print("Operation 2 done execution.")
//    }
//    
//    operation2.addDependency(operation1)
//    operationQueue.addOperation(operation1)
//    operationQueue.addOperation(operation2)
//}

func testOperations() {
    let operationQueue: OperationQueue = OperationQueue()
    let operation1: BlockOperation = BlockOperation(block: printOneToTen)
    let operation2: BlockOperation = BlockOperation(block: printElevenToTwenty)
    
    operation2.addDependency(operation1)
    operationQueue.addOperation(operation1)
    operationQueue.addOperation(operation2)
    
}

func printOneToTen(){
    DispatchQueue.global().async {
        for i in 1...10 {
            print(i)
        }
    }
}

func printElevenToTwenty(){
    DispatchQueue.global().async {
        for i in 11...20 {
            print(i)
        }
    }
}

func didLoad() {
    print("About to begin Operations")
    DispatchQueue.main.async { // do so it behave like app is running UI.
        testOperations()
    }
    print("Operations Executed.")
}

didLoad()



