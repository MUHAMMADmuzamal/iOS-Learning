//
//  AlertBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 05/11/2023.
//

import SwiftUI

struct AlertBootcamp: View {
    @State var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
//    @State var alertTitle:String = ""
//    @State var alertMessage:String = ""
    
    @State var backgroundColor:Color = .yellow
    
    enum MyAlerts {
        case success
        case error
    }
    var body: some View {
        ZStack {
            
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Button - 1"){
                    showAlert.toggle()
                    alertType = .error
//                    alertTitle = "alertTitle - 1"
//                    alertMessage = "alert message - 1😍"
                }
                
                Button("Button - 2"){
//                    alertTitle = "alertTitle - 2"
//                    alertMessage = "alert message - 2  😊"
                    alertType = .success
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert) {
        //            Alert(title: Text("There was an error"))
                    
                    
                    getAlert()
            }
            }
        }
    }
    
    func getAlert() -> Alert {
        switch alertType{
        case .error:
            return Alert(title: Text("There was an error."))
        case .success:
            return Alert(title: Text("Success."), message: nil, dismissButton: .default(Text("OK"), action:{
                backgroundColor = .red
            }))
        default:
            return Alert(title: Text(""))
        }
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("OK")))
        
        
//       return  Alert(
//            title: Text("This is the title"),
//            message: Text("This is message and it is optional can b nil"),
////                primaryButton: .destructive(Text("Delete")),
//            primaryButton: .destructive(Text("Delete"),action: {
//                backgroundColor = .red
//            }),
//            secondaryButton: .cancel())
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
