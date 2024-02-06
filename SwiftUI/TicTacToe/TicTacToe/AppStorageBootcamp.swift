//
//  AppStorageBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 22/01/2024.
//

import SwiftUI

struct AppStorageBootcamp: View {
    @State var currentUserName: String?
    @AppStorage("name1") var currentUserNameApp: String?
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "No User Name")
            Text(currentUserNameApp ?? "No User Name")
            Button("Save".uppercased()) {
               currentUserName = "Muzamal"
                currentUserNameApp = "App name" 
                UserDefaults.standard.set(currentUserName, forKey: "name")
            }
        }
        .onAppear{
            currentUserName = UserDefaults.standard.string(forKey: "name")
        }
    }
}

#Preview {
    AppStorageBootcamp()
}
