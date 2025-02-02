//
//  NetworkService.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import Foundation
import Network

final class NetworkService {
    
    static let shared = NetworkService()
    private var monitor: NWPathMonitor?
    
    private init() {
        
    }
    
    private func startNetworkMonitoring() {
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitorQueue")
        monitor?.start(queue: queue)
    }
    
    private func stopNetworkMonitoring() {
        monitor?.cancel()
    }
    
    func checkInternetConnection() async -> Bool {
        await withCheckedContinuation { continuation in
            startNetworkMonitoring()
            monitor?.pathUpdateHandler = { path in
                continuation.resume(returning: path.status == .satisfied)
                self.stopNetworkMonitoring()
            }
        }
    }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "restcountries.com"
        let endpoint = "/v3.1/all"
        let getParameters = ""
        
        let url = URL(string: tunnel + server + endpoint + getParameters)
        
        return url
    }
    
    func fetchData() async throws -> Data {
        guard let url = createURL() else {
            throw NetworkErrorService.badURL
        }
        
        do {
            let (data, responce) = try await URLSession.shared.data(from: url)
            guard let httpResponce = responce as? HTTPURLResponse, (200...299).contains(httpResponce.statusCode) else {
                throw NetworkErrorService.badResponce
            }
            return data
        } catch {
            throw NetworkErrorService.badRequest
        }
    }
}
