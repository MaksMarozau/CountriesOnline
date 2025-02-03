//
//  FavoriteCountriesViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 3.02.25.
//

import Foundation


final class FavoriteCountriesViewModel: ObservableObject, CountriesListProtocol {
    @Published var countriesToShowArray: [CountryModel] = []
    @Published var selectedCountry: CountryModel?
    @Published var isLoading: Bool = true
    
    func fetchFavoriteCountries(where countries: [CountryModel]) async {
        do {
            let cca3Codes = try await CoreDataService.shared.loadCca3Codes()
            cca3Codes.forEach { code in
                for country in countries {
                    if country.cca3 == code {
                        DispatchQueue.main.async {
                            self.countriesToShowArray.append(country)
                            self.isLoading = false
                        }
                    }
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            print(error.localizedDescription)
        }
    }
    
    
    func removeCountry(country: CountryModel) async throws {
        let cca3Code = country.cca3
        do {
            try CoreDataService.shared.deleteCca3Code(cca3Code: cca3Code)
        } catch {
            print(error.localizedDescription)
        }
    }
}
