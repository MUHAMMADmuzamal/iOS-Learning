import Cocoa
/*
var greeting = "Hello, playground"

var optionalValue:Int? = 100
//if optionalValue != nil{
//    print("optional value: \(String(describing: optionalValue!))")
//}

// if let op = optionalValue{
//     print(op)
// }else{
//     print("op has no value: \(op)")
// }

func test(){
    guard let op =  optionalValue else{
    return
}
print("optioanlValue: \(op)")
    
}

let assumedString:String! = "Hello world"
let implicitUnwarp:String = assumedString
implicitUnwarp
assumedString

let minusValue = 9
print(-minusValue)


for i in 2...10{
    print(i)
}

var str = """
Hello how are you\
i am fine how about you?
"""
str =
#"""
how are you"""end
"""#

str[str.startIndex]
str[str.index(after: str.startIndex)]
str[str.index(before: str.endIndex)]
str[str.index(str.startIndex, offsetBy: 5)]
str = "1234567890"
let range = str.index(str.endIndex, offsetBy: -6)..<str.endIndex
str.removeSubrange(range)


class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//var john: Person?
//var unit4A: Apartment?
//
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
//if true{
//    john!.apartment = unit4A
//    john = nil
//}



class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}


class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
var john: Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
john = nil


class HTMLElement {


    let name: String
    let text: String?


    lazy var asHTML: () -> String = {
            [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }


    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }


    deinit {
        print("\(name) is being deinitialized")
    }


}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil
*/
var seconds = 1.0
func  getData() async -> String{
    do{
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
    }catch{
        print("Error")
    }
    return "add download ready for use"
}

print("woking on code line 1")

print("still working on code line 100")
Task{
    let str  = await getData()
}

print("working on code")

var hex = 0xFF

hex = hex >> 1
hex = hex >> 1

let red = CGFloat((0xFF4034 & 0xFF0000) >> 16) / 255.0


var phrase = "The rain in Spain stays mainly in the plain."


let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
phrase.removeAll(where: {
    print($0)
    return vowels.contains($0) })

