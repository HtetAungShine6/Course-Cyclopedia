////
////  NetworkMonitor.swift
////  Course Cyclopedia
////
////  Created by Akito Daiki on 01/06/2024.
////
//
//import Foundation
//import Network
//import Combine
//
//class NetworkMonitor: ObservableObject {
//    
//    @Published var monitor = NWPathMonitor()
//    @Published var isInternetAvailable = false
//    
//    static let shared = NetworkMonitor()
//    
//    private var debounceCancellable: AnyCancellable?
//    
//    private init() {
//        monitorNetwork()
//    }
//    
//    func monitorNetwork() {
//        let queue = DispatchQueue(label: "NetworkMonitor")
//        
//        monitor.pathUpdateHandler = { [weak self] path in
//            guard let self = self else { return }
//            
//            self.debounceCancellable?.cancel()
//            self.debounceCancellable = Just(path)
//                .delay(for: .seconds(1), scheduler: DispatchQueue.main)
//                .sink { path in
//                    self.handlePathUpdate(path)
//                }
//        }
//        
//        monitor.start(queue: queue)
//    }
//    
//    private func handlePathUpdate(_ path: NWPath) {
//        if path.status == .satisfied {
//            if !self.isInternetAvailable {
//                print("Internet connection is available.")
//                DispatchQueue.main.async {
//                    if TokenManager.share.isTokenValid() {
//                        AppStateHandler.userSignInState()
//                    } else {
//                        AppStateHandler.userSignOutState()
//                    }
//                }
//                self.isInternetAvailable = true
//            }
//        } else {
//            if self.isInternetAvailable {
//                print("Connection Lost")
//                self.isInternetAvailable = false
//            }
//        }
//    }
//}
//
