import Cocoa

var greeting = "Hello, playground"

protocol AirTrafficControl {
    func requestTakeOff(airplane: Airplane)
    func requestLanding(airplane: Airplane)
}

class AirTowerControl: AirTrafficControl{
    func requestTakeOff(airplane: Airplane) {
        // reply to airplane
        airplane.notifyAirTrafficControl(message: "Requesting Take Off clearance.")
    }
    
    func requestLanding(airplane: Airplane) {
        airplane.notifyAirTrafficControl(message: "Requesting Landing clearance")
    }
}

protocol Airplane {
    func requestTakeOff()
    func requestLanding()
    func notifyAirTrafficControl(message: String)
}


class CommercialAirplane: Airplane {
    private var mediator: AirTrafficControl
    
    init(mediator: AirTrafficControl) {
        self.mediator = mediator
    }
    
    func requestTakeOff() {
        // send message to mediator
        mediator.requestTakeOff(airplane: self)
    }
    
    func requestLanding() {
        mediator.requestLanding(airplane: self)
    }
    
    func notifyAirTrafficControl(message: String) {
       print("Commercial Airplane: \(message)")
    }
}

//Main
let controlTower = AirTowerControl()
let airplane1 = CommercialAirplane(mediator: controlTower)
let airplane2 = CommercialAirplane(mediator: controlTower)

airplane1.requestTakeOff()
airplane2.requestLanding()




//Example # 2
protocol Mediator {
    func notify(sender: Sender)
}

protocol Sender {
    func updateOnMediatorResponse()
    func doOperation()
}

class ComponentA: Sender {

    private var mediator: Mediator
    init(mediator: Mediator){
        self.mediator = mediator
    }
    
    func doOperation() {
        print("------Start--------")
        print("notify mediator after doing some operation")
        mediator.notify(sender: self)
    }
    func updateOnMediatorResponse() {
        print("component A - get Reply.")
        print("------End--------")
    }
}
class ComponentB: Sender {
    private var mediator: Mediator
    init(mediator: Mediator){
        self.mediator = mediator
    }
    func updateOnMediatorResponse() {
        print("component b - get Reply.")
        print("------End--------")
    }
    func doOperation() {
        print("------Start--------")
        print("notify mediator after doing some operation")
        mediator.notify(sender: self)
    }
}

class MediatorClass: Mediator{
    func notify(sender: Sender) {
        print("process sender\(sender)")
        sender.updateOnMediatorResponse()
    }
}

let mediator = MediatorClass()
let componentA = ComponentA(mediator: mediator)
let componentB = ComponentB(mediator: mediator)
componentA.doOperation()
componentB.doOperation()
