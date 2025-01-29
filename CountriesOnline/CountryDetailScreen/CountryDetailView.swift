//
//  CountryDetailView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountryDetailView: View {
    let country: CountryModel
    
    var body: some View {
        VStack {
            Text("Добро пожаловать в \(country.name)!")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(country.name)
    }
}

#Preview {
    let country: CountryModel = CountryModel(name: "Belarus", flag: UIImage(systemName: "flag")!, region: "Europe")
    CountryDetailView(country: country)
}
