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
        }
}

#Preview {
    MessagesView()
}
