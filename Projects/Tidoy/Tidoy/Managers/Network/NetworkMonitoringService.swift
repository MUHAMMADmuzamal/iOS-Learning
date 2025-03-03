//
//  NetworkMonitoringService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation
import Network

class NetworkMonitoringService {
    private let monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var isReachable: Bool = true
    
    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: queue)
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isReachable = true
            } else {
                self.isReachable = false
            }
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
