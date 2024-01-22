import Cocoa

var greeting = "Hello, playground"


protocol Pizza{
    func cost() -> Int
}

class Farmhouse: Pizza{
    func cost() -> Int {
        100
    }
}

class VegDelight: Pizza{
    func cost() -> Int {
        200
    }
}

// Making Is-a Relation
protocol Topping: Pizza {

}

class ExtraCheese: Topping{
    
    var pizza: Pizza! // Making Has-a Relation
    
    init(pizza: Pizza){
        self.pizza = pizza
    }
    
    func cost() -> Int {
        return self.pizza.cost() + 10
    }
}

class Mashroom: Topping{
    
    var pizza: Pizza!
    
    init(pizza: Pizza){
        self.pizza = pizza
    }
    
    func cost() -> Int {
        self.pizza.cost() + 20
    }
}

let vegDelight = VegDelight()
print("Base pizza cost: ", vegDelight.cost())

let mashroomTopping = Mashroom(pizza: vegDelight)
print("Base pizza cost + mashroom Topping cost: ", mashroomTopping.cost())

let mashroomPlusExtracheeseTopping = ExtraCheese(pizza: mashroomTopping)
print("Base pizza cost + mashroom + extraCheese cost: ", mashroomPlusExtracheeseTopping.cost())
