import Cocoa

var greeting = "Hello, playground"

protocol Command {
    func execute()
}

// Receiver
protocol Device {
    func turnOn()
    func turnOff()
}

class TV: Device {
    func turnOn() {
        print("Tv is turn on")
    }   
    
    func turnOff() {
        print("Tv is turn off")
    }
    
    func changeChannel(){
        print("Tv channel changed")
    }
}

class Stereo: Device {
    func turnOn() {
        print("Stereo is turn on")
    }
    
    func turnOff() {
        print("Stereo is turn off")
    }
    
    func adjustVolume(){
        print("Stereo volume adjusted")
    }
}

//Concrete Commands

class TurnOnCommand: Command {
    private var device: Device
    
    init(device: Device) {
        self.device = device
    }
    
    func execute() {
        device.turnOn()
    }
}

class TurnOffCommand: Command {
    private var device: Device
    
    init(device: Device) {
        self.device = device
    }
    
    func execute() {
        device.turnOff()
    }
}

class AdjustVolume: Command {
    private var device: Stereo
    
    init(device: Stereo) {
        self.device = device
    }
    
    func execute() {
        device.adjustVolume()
    }
}

class ChangeChannel: Command {
    private var device: TV
    
    init(device: TV) {
        self.device = device
    }
    
    func execute() {
        device.changeChannel()
    }
}


//Invoker
class RemoteControl {
    private var command: Command?
    
    func setCommand(command: Command) {
        self.command = command
    }
    
    func pressButton() {
        command?.execute()
    }
}


//Main
//Create Devices
let tv = TV()
let stereo = Stereo()
//Create Command Object
let turnOnCommand = TurnOnCommand(device: tv)
let turnOffCommand = TurnOffCommand(device: tv)
let adjustVolume = AdjustVolume(device: stereo)
let changeChannel = ChangeChannel(device: tv)

//create Remote control
let remoteControl = RemoteControl()

//set and execute command
remoteControl.setCommand(command: turnOnCommand)
remoteControl.pressButton()

remoteControl.setCommand(command: turnOffCommand)
remoteControl.pressButton()

remoteControl.setCommand(command: adjustVolume)
remoteControl.pressButton()

remoteControl.setCommand(command: changeChannel)
remoteControl.pressButton()
