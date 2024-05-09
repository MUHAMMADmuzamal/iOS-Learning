import Cocoa

var greeting = "Hello, playground"

// Memento

class DocumentMemento {
    private var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func getSavedContent() -> String {
        content
    }
}

//Originator

class Document {
    private var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func write(_ text: String) {
        content += "-" + text
    }
    
    func getContent() -> String {
        content
    }
    
    func createMemento() -> DocumentMemento {
        DocumentMemento(content: self.content)
    }
    
    func restoreFromMemento(_ documentMemento: DocumentMemento) {
        content = documentMemento.getSavedContent()
    }
}

//Care Taker

class History {
    private var listOfDocuments:[DocumentMemento] = []
    
    init(){
        listOfDocuments = []
    }
    
    func addMemento(_ memento: DocumentMemento){
        listOfDocuments.append(memento)
    }
    
    func getMemento(index: Int) -> DocumentMemento {
        listOfDocuments[index]
    }
}

// Main

let document = Document(content: "initial content")
let history = History()
print(document.getContent())

document.write("additional content")
history.addMemento(document.createMemento())
print(document.getContent())

document.write("more content")
history.addMemento(document.createMemento())
print(document.getContent())

document.restoreFromMemento(history.getMemento(index: 0))

print("After Restore to last state.",document.getContent())
