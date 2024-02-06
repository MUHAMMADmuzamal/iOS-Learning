import Cocoa

var greeting = "Hello, playground"

protocol PizzaProtocol {
    var id: String { get }
    var basePizza: BasePizza { get set }
    func getPrice() -> Int
}

class BasePizza {
    func makePizza() {
        print("Base pizza")
    }
    
    func getPrice() -> Int {
        100
    }
}

class ExtraCheesePizza: BasePizza, Identifiable {
    var id: String = UUID().uuidString
    
    var basePizza: BasePizza
    
    init(basePizza: BasePizza) {
        self.basePizza = basePizza
    }
    
    override func getPrice() -> Int {
        return 10 + basePizza.getPrice()
    }
}

class LessCheesePizza: BasePizza, Identifiable {
    var id: String = UUID().uuidString
    
    var basePizza: BasePizza
    
    init(basePizza: BasePizza) {
        self.basePizza = basePizza
    }
    
    override func getPrice() -> Int {
        return 2 + basePizza.getPrice()
    }
}

let basePizza = BasePizza()
let extraCheese = ExtraCheesePizza(basePizza: basePizza)
extraCheese.getPrice()
let lessCheese = LessCheesePizza(basePizza: basePizza)
lessCheese.getPrice()

let extraPlusLessCheese = ExtraCheesePizza(basePizza: lessCheese)
extraPlusLessCheese.getPrice()

//MARK: learn that base is same for all decorate with different things.
