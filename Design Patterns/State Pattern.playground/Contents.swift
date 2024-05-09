import Cocoa

var greeting = "Hello, playground"

protocol VendingMachineState {
    func handleRequest()
}

class ReadyState: VendingMachineState {
    func handleRequest() {
        print("Ready State: Please select a product.")
    }
}

class ProductSelectState: VendingMachineState {
    func handleRequest() {
        print("Product Select State: Processing payment.")
    }
}

class PaymentPendingState: VendingMachineState {
    func handleRequest() {
        print("Payment pending State: Dispensing product.")
    }
}

class OutOfStockState: VendingMachineState {
    func handleRequest() {
        print("Out of stock State: Product unavailable. Please select another product.")
    }
}

class VendingMachineContext {
    private var state: VendingMachineState?
    
    func setState(state: VendingMachineState) {
        self.state = state
    }
    
    func request(){
        state?.handleRequest()
    }
}


//Main

let vendingMachine = VendingMachineContext()
vendingMachine.setState(state: ReadyState())
vendingMachine.request()

vendingMachine.setState(state: ProductSelectState())
vendingMachine.request()

vendingMachine.setState(state: PaymentPendingState())
vendingMachine.request()

vendingMachine.setState(state: OutOfStockState())
vendingMachine.request()

