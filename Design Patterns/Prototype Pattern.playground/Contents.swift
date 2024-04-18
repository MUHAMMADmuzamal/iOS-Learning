import Cocoa

var greeting = "Hello, playground"

protocol DocumentPrototypeProtocol {
    init(name: String, marks: Int)
    func clone() -> Self
    func display()
}

class ResultCard: DocumentPrototypeProtocol {
    private var id = UUID().uuidString
    private var name: String
    private var marks: Int
    
    required init(name: String, marks: Int) {
        self.name = name
        self.marks = marks
    }
    
    func clone() -> Self {
        let clone = type(of: self).init(name: self.name, marks: self.marks)
        clone.id = self.id
        return clone
    }
    
    func display(){
        print("ID: ", self.id, " Name: ", self.name, " Marks: ", self.marks)
    }
}

//use
let resultCardOfStudent1 = ResultCard(name: "Student-1", marks: 100)
resultCardOfStudent1.display()
let cloneOfStudent1 = resultCardOfStudent1.clone()
cloneOfStudent1.display()
