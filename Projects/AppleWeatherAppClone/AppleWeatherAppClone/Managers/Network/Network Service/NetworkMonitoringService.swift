//
//  NetworkMonitoringService.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
import Network

// MARK: - NetworkMonitoringService
class NetworkMonitoringService {
    private var monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var isNetworkAvailable: Bool = true

    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: self.queue)
        
        self.startMonitoring()
    }

    func startMonitoring() {
        self.monitor.pathUpdateHandler = { path in
            self.isNetworkAvailable = path.status == .satisfied
        }
    }

    func stopMonitoring() {
        self.monitor.cancel()
    }
}
