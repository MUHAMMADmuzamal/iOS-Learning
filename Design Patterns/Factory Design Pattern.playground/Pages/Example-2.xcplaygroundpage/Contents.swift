//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Vehicle {
    func printVehicle()
}

class TwoWheeler: Vehicle {
    func printVehicle() {
        print("Two wheeler")
    }
}

class FourWheeler: Vehicle {
    func printVehicle() {
        print("Four wheeler")
    }
}

protocol VehicleFactory {
    func createVehicle() -> Vehicle
}

class TwoWheelerFactory: VehicleFactory {
    func createVehicle() -> Vehicle {
        TwoWheeler()
    }
}

class FourWheelerFactory: VehicleFactory {
    func createVehicle() -> Vehicle {
        FourWheeler()
    }
}

class Client {
    private var vehicle: Vehicle
    
    init(vehicleFactory: VehicleFactory) {
        vehicle = vehicleFactory.createVehicle()
    }
    
    func getVehicle() {
        vehicle.printVehicle()
    }
}

var twoWheelerClient =  Client(vehicleFactory: TwoWheelerFactory())
twoWheelerClient.getVehicle()
var fourWheelerClient =  Client(vehicleFactory: FourWheelerFactory())
fourWheelerClient.getVehicle()

// in Future new Six Wheeler client come
class SixWheelerVehicle: Vehicle {
    func printVehicle() {
        print("Six Wheeler")
    }
}

class SixWheelerFactory: VehicleFactory {
    func createVehicle() -> Vehicle {
        SixWheelerVehicle()
    }
}

var sixWheelerClient = Client(vehicleFactory: SixWheelerFactory())
sixWheelerClient.getVehicle()


