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
        .navigationTitle(country.name.official)
    }
}

#Preview {
    let country = CountriesViewModel().countriesToShowArray.first!
    CountryDetailView(country: country)
}
