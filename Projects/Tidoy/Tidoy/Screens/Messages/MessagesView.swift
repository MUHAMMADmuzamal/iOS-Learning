//
//  MessagesView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct MessagesView: View {
    @StateObject private var webSocketManager = MessagesVM()
    @State private var messageToSend = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text(webSocketManager.isConnected ? "Connected ✅" : "Disconnected ❌")
                .foregroundColor(webSocketManager.isConnected ? .green : .red)
            
            Text("Received: \(webSocketManager.receivedMessage)")
                .padding()
            
            TextField("Enter message", text: $messageToSend)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Connect") {
                    webSocketManager.connect()
                }
                .buttonStyle(.bordered)
                
                Button("Send") {
                    webSocketManager.sendMessage(messageToSend)
                }
                .buttonStyle(.bordered)
                .disabled(messageToSend.isEmpty)
                
                Button("Disconnect") {
                    webSocketManager.disconnect()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.gray)
                        .frame(height: 50)  // Adjust height of nav bar
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss() // Custom back action
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Custom icon
                        Text("Back")
                    }
                    .foregroundStyle(Color.red)
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {}) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MessagesView()
    }
}
