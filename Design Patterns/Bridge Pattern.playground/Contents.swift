import Cocoa

var greeting = "Hello, playground"

//Problem

protocol ShapeExample {
    var colour: String {get set}
}

class RedCircle: ShapeExample {
    var colour: String = "Red"
}
class RedRectangle: ShapeExample {
    var colour: String = "Red"
}

class BlueCircle: ShapeExample {
    var colour: String = "Blue"
}

class BlueRectangle: ShapeExample {
    var colour: String = "Blue"
}

// grow exponentially.

// using bridge
protocol Color {
    var name: String {get}
}

protocol Shape {
    var colour: Color {get set}
}

class Circle: Shape {
    var colour: Color
    init(colour: Color) {
        self.colour = colour
    }
}

class Square: Shape {
    var colour: Color
    init(colour: Color) {
        self.colour = colour
    }
}

class RedColor: Color {
    var name: String = "Red"
}

class BlueColor: Color {
    var name: String = "Blue"
}

class GreeenColor: Color {
    var name: String = "Blue"
}

let redSquare = Square(colour: RedColor())
let blueSquare = Square(colour: BlueColor())
let blueCircle = Circle(colour: BlueColor())

print("Red Square Color: ", redSquare.colour.name)
print("Blue Square Color: ", blueSquare.colour.name)
print("BLue Circle Color: ", blueCircle.colour.name)
