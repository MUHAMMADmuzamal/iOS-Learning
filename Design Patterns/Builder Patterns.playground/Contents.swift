import Cocoa

var greeting = "Hello, playground"

class Computer {
    var cpu: String?
    var ram: String?
    var storage: String?
    
    func setCpu(_ cpu: String) {
        self.cpu = cpu
    } 
    
    func setRam(_ ram: String) {
        self.ram = ram
    } 
    
    func setStorage(_ storage: String) {
        self.storage = storage
    }
    
    func displayInfo() {
        print("Computer Configuration: ", "\nCPU: ", self.cpu ?? "--", "\nRAM: ", self.ram ?? "--", "\nStorage: ", self.storage ?? "--")
    }
}

protocol Builder {
     func buildCpu()
     func buildRam()
     func buildStorage()
     func getResult() -> Computer?
}

class GamingComputerBuilder: Builder {
    
    private var computer: Computer
    
    init() {
        self.computer = Computer()
    }
    
    func buildCpu() {
        self.computer.setCpu("Gaming CPU")
    }
    
    func buildRam() {
        self.computer.setRam("16 GB DDR5")
    }
    
    func buildStorage() {
        self.computer.setStorage("1 TB")
    }
    
    func getResult() -> Computer? {
        self.computer
    }
}

class PersonalComputerBuilder: Builder {
    
    private var computer: Computer
    
    init() {
        self.computer = Computer()
    }
    
    func buildCpu() {
        self.computer.setCpu("Personal CPU")
    }
    
    func buildRam() {
        self.computer.setRam("2 GB DDR5")
    }
    
    func buildStorage() {
        self.computer.setStorage("500 GB")
    }
    
    func getResult() -> Computer? {
        self.computer
    }
}

class Director{
    func construct(builder: Builder) {
        builder.buildCpu()
        builder.buildRam()
        builder.buildStorage()
    }
}
let director = Director()
let gamingComputerBuilder = GamingComputerBuilder()
let personalComputerBuilder = PersonalComputerBuilder()
director.construct(builder: gamingComputerBuilder)
let gamingComputer = gamingComputerBuilder.getResult()
director.construct(builder: personalComputerBuilder)
let personalComputer = personalComputerBuilder.getResult()
gamingComputer?.displayInfo()
personalComputer?.displayInfo()

