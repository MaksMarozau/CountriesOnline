//
//  CountriesViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI


protocol CountriesListProtocol: ObservableObject {
    var countriesToShowArray: [CountryModel] { get set }
    var selectedCountry: CountryModel? { get set }
    
    func removeCountry(country: CountryModel) async throws
}


final class CountriesViewModel: ObservableObject, CountriesListProtocol {
    
    private var originCountriesArray: [CountryModel] = []
    @Published var countriesToShowArray: [CountryModel] = []
    @Published var selectedCountry: CountryModel?
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    @Published var keyWords: String = "" {
        didSet {
            filterCountries(by: keyWords)
        }
    }
    
    private func fetchData() async throws -> Data {
        do {
            if await NetworkService.shared.checkInternetConnection() == true {
                let data = try await NetworkService.shared.fetchData()
                try await CoreDataService.shared.cacheCounrtiesData(counrtiesData: data)
                return data
            } else {
                do {
                    let data = try await CoreDataService.shared.loadСachedCountriesData()
                    DispatchQueue.main.async {
                        self.errorMessage = InthernetConectionErrorService.noInternetConnectionWithCache.rawValue
                    }
                    return data
                } catch {
                    throw InthernetConectionErrorService.noInternetConnectionWithoutCache
                }
            }
        } catch {
            throw error
        }
    }
    
    private func decodeData(data: Data) throws -> [CountryModel] {
        let decodedData = try ParcingService.shared.decodeData(data: data)
        return decodedData
    }
    
    private func sortCountries(countries: [CountryModel]) -> [CountryModel] {
        let sortedCountries = countries.sorted { $0.name.common < $1.name.common }
        return sortedCountries
    }
    
    private func showCountries() {
        self.countriesToShowArray = self.originCountriesArray
        isLoading = false
    }
    
    private func errorsProcessing(_ error: Error) {
        if let currentError = error as? NetworkErrorService {
            errorMessage = currentError.rawValue + "\nYou can try to restart the application"
        } else if let currentError = error as? CoreDataErrorService {
            errorMessage = currentError.rawValue + "\nPlease, relaunch the application"
        }
    }


    func filterCountries(by keyword: String) {
        var filtredCountriesArray: [CountryModel] = []
        if keyword.isEmpty {
            countriesToShowArray = originCountriesArray
        } else {
            filtredCountriesArray = originCountriesArray.filter({ $0.name.common.lowercased().hasPrefix(keyword.lowercased()) })
            countriesToShowArray = filtredCountriesArray
        }
    }
    
    func fetchCountries() async {
        do {
            let countriesData = try await fetchData()
            let countries = try decodeData(data: countriesData)
            let sortedCountries = sortCountries(countries: countries)
            self.originCountriesArray = sortedCountries
            DispatchQueue.main.async {
                self.showCountries()
            }
        } catch {
            DispatchQueue.main.async {
                self.errorsProcessing(error)
            }
        }
    }
    
    func removeCountry(country: CountryModel) async throws {
        
    }
}
