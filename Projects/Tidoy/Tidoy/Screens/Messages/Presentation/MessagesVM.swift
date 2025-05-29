//
//  MessagesVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/03/2025.
//

import Foundation
import Combine

protocol MessagesVMProtocol: ObservableObject {
    var searchText: String { get set }
    var filteredMessages: [MessageScreenRowModel] { get }
}

class MessagesVM: MessagesVMProtocol {
    @Published var searchText: String = ""
    @Published private(set) var filteredMessages: [MessageScreenRowModel] = []
    
    private var messagesList: [MessageScreenRowModel] = MessageScreenRowModel.mockDataList
    private var cancellables = Set<AnyCancellable>()
    private var router: MessagesScreenRouterProtocol
    init(router: MessagesScreenRouterProtocol) {
        self.router = router
        setupBindings()
        filteredMessages = messagesList
    }
    
    private func setupBindings() {
        $searchText
            .removeDuplicates()
            .combineLatest(Just(messagesList))
            .map { searchText, messages in
                guard !searchText.isEmpty else { return messages }
                return messages.filter {
                    $0.title.lowercased().contains(searchText.lowercased()) ||
                    $0.lastMessage.lowercased().contains(searchText.lowercased())
                }
            }
            .assign(to: &$filteredMessages)
    }
    
    func updateMessagesList(_ newMessages: [MessageScreenRowModel]) {
        messagesList = newMessages
        applyFilter()
    }
    
    private func applyFilter() {
        // Manually trigger filter if needed outside of Combine
        filteredMessages = searchText.isEmpty ? messagesList : messagesList.filter {
            $0.title.lowercased().contains(searchText.lowercased()) ||
            $0.lastMessage.lowercased().contains(searchText.lowercased())
        }
    }
    
}
/** // for web Socket.
 extension MessagesVM {
 
 private var webSocketTask: URLSessionWebSocketTask?
 private let url = URL(string: "ws://localhost:8000/ws/1")! // Replace with your WebSocket server URL
 @Published var isConnected = false
 @Published var receivedMessage: String = ""
 
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
 } */
