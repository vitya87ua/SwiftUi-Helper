//
//  NetworkStatus.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 29.04.2022.
//

import Foundation
import Network

class NetworkStatus {
    static let shared = NetworkStatus()
    
    private var monitor: NWPathMonitor
    private(set) var isConnected: Bool = false
    private(set) var connectionType: NWInterface.InterfaceType?
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        self.monitor.start(queue: .main)
        
        self.monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                print("✅ We're connected! with", self?.connectionType)
                self?.isConnected = true
                self?.getConnectionType(path)
            } else {
                print("❌ No connection.")
                self?.isConnected = false
            }
        }
    }
    
    func stopMonitoring() {
        self.monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .wiredEthernet
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        } else if path.usesInterfaceType(.loopback) {
            connectionType = .loopback
        } else if path.usesInterfaceType(.other) {
            connectionType = .other
        }
    }
}
