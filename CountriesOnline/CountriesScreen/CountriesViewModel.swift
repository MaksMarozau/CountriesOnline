//
//  CountriesViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

final class CountriesViewModel: ObservableObject {
    
    @Published var countries: [CountryModel] = [
        CountryModel(name: "Belarus", flag: UIImage(systemName: "flag")!, region: "Europe"),
        CountryModel(name: "Ukraine", flag: UIImage(systemName: "flag")!, region: "Europe"),
        CountryModel(name: "USA", flag: UIImage(systemName: "flag")!, region: "America")
    ]
    
    @Published var selectedCountry: CountryModel?
}
