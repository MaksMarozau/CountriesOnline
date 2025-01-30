//
//  CountriesViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

final class CountriesViewModel: ObservableObject {
    
    @Published var countries: [CountryModel] = []
    @Published var selectedCountry: CountryModel?
    
    func fetchCountries() async {
        do {
            let countriesData = try await NetworkService.shared.fetchData()
            let countries = try ParcingService.shared.decodeData(data: countriesData)
            self.countries = countries
        } catch {
            print("Error fetching countries: \(error as? NetworkErrorService)")
        }
    }
}
