import Cocoa

var greeting = "Hello, playground"

protocol Printer {
    func print()
}

// Existing class
class LegacyPrinter {
    func printDocument() {
        print("legacy printer printing document")
    }
}

// Adapter class to adapt legacy printer and make compatible with new requriments

class PrinterAdapter: Printer {
    private var legacyPrinter: LegacyPrinter = LegacyPrinter()
    
    func print() {
        legacyPrinter.printDocument()
    }
}

func clientCode(printer: Printer){
    printer.print()
}


let printerAdapter = PrinterAdapter()
clientCode(printer: printerAdapter)
