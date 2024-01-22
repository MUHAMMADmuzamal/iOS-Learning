import Cocoa

var greeting = "Hello, playground"


protocol DriveStrategy{
    func drive()
}

class NormalDriveStrategy: DriveStrategy{
    func drive() {
        print("Normal Drive Strategy")
    }
}


class SportsDriveStrategy: DriveStrategy{
    func drive() {
        print("Sports Drice Strategy")
    }
}

class XyzDriveStrategy: DriveStrategy{
    func drive() {
        print("Xyz Drive Strategy")
    }
}

//MARK: -
class Vehicle{
    var driveStrategy: DriveStrategy?
    init(driveStrategy: DriveStrategy){
        self.driveStrategy = driveStrategy
    }
    // name what you want.
    func drive(){
        self.driveStrategy?.drive()
    }
}

//MARK: - Different Types of Cars
class OffRoadCar: Vehicle{
    init() {
        super.init(driveStrategy: SportsDriveStrategy())
    }
}

class PassengerCar: Vehicle{
    init() {
        super.init(driveStrategy: NormalDriveStrategy())
    }
}

class KidCar: Vehicle{
    init() {
        super.init(driveStrategy: XyzDriveStrategy())
    }
}


// use classes in program

let offRoadCarObject: Vehicle = OffRoadCar()
offRoadCarObject.drive()

let kidCarObject: Vehicle = KidCar()
kidCarObject.drive()


//MARK: - USING CLOUSERS TO IMPLIMENT STRATEGY PATTERN

class vehicleClouserExample{
    func drive(strategy: ()->Void){
        strategy()
    }
}

let kidSportsCar: vehicleClouserExample = vehicleClouserExample()
kidSportsCar.drive(){
    print("kids sports car strategy.")
}
