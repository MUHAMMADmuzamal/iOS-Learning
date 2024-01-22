import Cocoa

var greeting = "Hello, playground"

protocol Observer{
    var _id: Int{get set}
    func update()
}
protocol StocksObservable{
    func notify()
    func add(observer: Observer)
    func remove(observer: Observer)
    func setStockCount(count: Int)
    func getStockCount()-> Int
}



//Observable implimentatiaon
class IphoneObservable: StocksObservable{
    var listOfObservers:[Observer] = []
    private var inStock = 0
    func add(observer:Observer){
        guard self.listOfObservers.contains(where: {$0._id == observer._id}) == false else{
            return
        }
        self.listOfObservers.append(observer)
    }
    
    func remove(observer: Observer){
        self.listOfObservers = self.listOfObservers.filter({$0._id != observer._id})
    }
    
    func notify(){
        for observer in listOfObservers{
            observer.update()
        }
    }
    
    func setStockCount(count: Int) {
        self.inStock += count
        self.notify()
    }
    
    func getStockCount() -> Int {
        self.inStock
    }
    
}


// observer

class EmailAlertObserver: Observer{
    var _id: Int
    
    var email: String?
    init(id:Int, email:String){
        self.email = email
        self._id = id
    }
    func update() {
        print("\(String(describing: self.email)): Iphone new stock availible.")
    }
}
class MobileAlertObserver: Observer{
    var _id: Int
    
    var mobile: String?
    init(id:Int,mobile:String){
        self.mobile = mobile
        self._id = id
    }
    func update() {
        print("\(String(describing: self.mobile)): Iphone new stock availible.")
    }
}

class PushAlertObserver: Observer{
    var _id: Int
    
    var push: String?
    init(id:Int,push:String ){
        self.push = push
        self._id = id
    }
    func update() {
        print("\(String(describing: self.push)): Iphone new stock availible.")
    }
}

// in main function or where need to use.
let iphoneObservableObject: StocksObservable = IphoneObservable()

let observer1 = EmailAlertObserver(id:1,email: "observer1@gmail.com")
let observer2 = EmailAlertObserver(id:2,email: "observer2@gmail.com")
let observer3 = MobileAlertObserver(id:3,mobile: "123456789")
let observer4 = PushAlertObserver(id:4,push: "push notification")

iphoneObservableObject.add(observer: observer1)
iphoneObservableObject.add(observer: observer2)
iphoneObservableObject.add(observer: observer3)
iphoneObservableObject.add(observer: observer4)
iphoneObservableObject.remove(observer: observer1)



iphoneObservableObject.setStockCount(count: 10)

