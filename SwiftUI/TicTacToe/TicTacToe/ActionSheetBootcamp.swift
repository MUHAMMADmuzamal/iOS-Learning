//
//  ActionSheetBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 20/11/2023.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    @State var showActionSheet = false
    @State var actionSheetOption: ActionSheetOptions  = .isMyPost
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
    var body: some View {
//        Button("click me"){
//            showActionSheet.toggle()
//        }
        VStack {
            HStack{
                Circle()
                    .frame(width:30, height: 30)
                Text("$username")
                Spacer()
                Button(action: {
                    showActionSheet.toggle()
                    actionSheetOption = .isMyPost
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .accentColor(.primary)
            }
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
//        return ActionSheet(title: Text("helloworld"))
        
        let share: ActionSheet.Button = .default(Text("Share"), action:{
            
        })
        let report: ActionSheet.Button = .destructive(Text("Report"), action:{
            
        })
        let delete: ActionSheet.Button = .destructive(Text("Delete"), action:{
            
        })
        let cancel: ActionSheet.Button = .cancel()
        
        var title = Text("What woud you like to do?")
        switch actionSheetOption{
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [share, report])
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [share, report, delete, cancel])
        }
//        let button1: ActionSheet.Button = .default(Text("DEFAULT"))
//        let button2: ActionSheet.Button = .destructive(Text("Destructive"))
//        let button3: ActionSheet.Button = .cancel()
//
//        return ActionSheet(
//            title: Text("This is a title"),
//            message: Text("this is a message"),
//            buttons: [button1, button2, button3])
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
