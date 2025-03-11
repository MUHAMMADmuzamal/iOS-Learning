//
//  MessagesVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/03/2025.
//

import Foundation

class MessagesVM: ObservableObject {
    private var webSocketTask: URLSessionWebSocketTask?
    private let url = URL(string: "ws://localhost:8000/ws/1")! // Replace with your WebSocket server URL
    
    @Published var receivedMessage: String = ""
    @Published var isConnected = false
    
    func connect() {
        let session = URLSession(configuration: .default)
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        isConnected = true
        receiveMessage() // Start listening for messages
    }
    
    func sendMessage(_ message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Error sending message: \(error)")
            }
        }
    }
    
    func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                DispatchQueue.main.async {
                    switch message {
                    case .string(let text):
                        self?.receivedMessage = text
                    case .data(let data):
                        self?.receivedMessage = "Received binary data: \(data.count) bytes"
                    @unknown default:
                        break
                    }
                }
                self?.receiveMessage() // Keep listening for new messages
            case .failure(let error):
                print("Error receiving message: \(error)")
            }
        }
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
        isConnected = false
    }
}
