import Cocoa

var greeting = "Hello, playground"

protocol RoomElement {
    func accept(_ visitor: RoomVisitor)
}

class SingleRoom: RoomElement {
    var roomPrice: Int = 0
    func accept(_ singleRoom: RoomVisitor){
        singleRoom.visit(self)
    }
}

class DoubleRoom: RoomElement {
    var roomPrice: Int = 0
    func accept(_ doubleRoom: RoomVisitor){
        doubleRoom.visit(self)
    }
}

class DeluxeRoom: RoomElement {
    var roomPrice: Int = 0
    func accept(_ deluxeRoom: RoomVisitor){
        deluxeRoom.visit(self)
    }
}

protocol RoomVisitor {
    func visit(_ singleRoom: SingleRoom)
    func visit(_ doubleRoom: DoubleRoom)
    func visit(_ deluxeRoom: DeluxeRoom)
}

class RoomPricingVisitor: RoomVisitor {
    func visit(_ singleRoom: SingleRoom) {
        print("single room pricing")
        singleRoom.roomPrice = 100
    }
    
    func visit(_ doubleRoom: DoubleRoom) {
        print("double room pricing")
        doubleRoom.roomPrice = 200
    }
    
    func visit(_ deluxeRoom: DeluxeRoom) {
        print("deluxe room pricing")
        deluxeRoom.roomPrice = 400
    }
}

class RoomMaintenanceVisitor: RoomVisitor {
    func visit(_ singleRoom: SingleRoom) {
        print("performing maintenance of single room")
    }
    
    func visit(_ doubleRoom: DoubleRoom) {
        print("performing maintenance of double room")
    }
    
    func visit(_ deluxeRoom: DeluxeRoom) {
        print("performing maintenance of deluxe room")
    }
}

//Main
let singleRoom = SingleRoom()
let doubleRoom = DoubleRoom()
let deluxeRoom = DeluxeRoom()

let roomPricingVisitor = RoomPricingVisitor()
let roomMaintenanceVisitor = RoomMaintenanceVisitor()

singleRoom.accept(roomPricingVisitor)
print(singleRoom.roomPrice)

doubleRoom.accept(roomPricingVisitor)
print(doubleRoom.roomPrice)

deluxeRoom.accept(roomPricingVisitor)
print(deluxeRoom.roomPrice)

singleRoom.accept(roomMaintenanceVisitor)
doubleRoom.accept(roomMaintenanceVisitor)
deluxeRoom.accept(roomMaintenanceVisitor)
