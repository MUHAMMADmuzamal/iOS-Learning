import Cocoa

var greeting = "Hello, playground"

protocol EmployeeDao{
    func create(client: String, empObj: EmployeeDo)
    func delete(client: String, employeeId: Int)
    func get(client: String, employeeId: Int)-> EmployeeDo
    
}

class EmployeeDo{
}

class EmployeeDaoImpl: EmployeeDao{
    func create(client: String, empObj: EmployeeDo){
        print("Real-Employee Created:\(client)")
    }
    func delete(client: String, employeeId: Int){
        print("Real-Employee Deleted:\(client) - ID: \(employeeId)")
    }
    func get(client: String, employeeId: Int)-> EmployeeDo{
        print("Real-fetching data from db.")
        return EmployeeDo()
    }
}
class EmployeeDaoProxy: EmployeeDao{
    var employeeDaoObj: EmployeeDao?
    init(){
        employeeDaoObj = EmployeeDaoImpl()
    }
    func create(client: String, empObj: EmployeeDo){
        if client == "ADMIN"{
            print("Proxy-Employee Created:\(client)")
            employeeDaoObj?.create(client: client, empObj: empObj)
        }else{
            print("Access Denied")
        }
        
    }
    func delete(client: String, employeeId: Int){
        if client == "ADMIN"{
            print("Proxy-Employee Deleted:\(client) - ID: \(employeeId)")
            employeeDaoObj?.delete(client: client, employeeId: employeeId)
        }else{
            print("Access Denied")
        }
        
    }
    
    func get(client: String, employeeId: Int)-> EmployeeDo{
        
        if client == "ADMIN" || client == "USER"{
            print("Proxy-fetching data from db.")
            employeeDaoObj?.get(client: client, employeeId: employeeId)
        }else{
            print("Access Denied")
        }
        
        return EmployeeDo()
    }
}

let empTableObj: EmployeeDao = EmployeeDaoProxy()
empTableObj.create(client: "ADMIN", empObj: EmployeeDo())
