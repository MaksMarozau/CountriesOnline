//
//  ParcingService.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import Foundation

final class ParcingService {
    
    static let shared = ParcingService()
    
    private init() {}
    
    func decodeData(data: Data) throws -> [CountryModel] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let result = try decoder.decode([CountryModel].self, from: data)
            return result
        } catch {
            throw NetworkErrorService.invalidData
        }
    }
}
