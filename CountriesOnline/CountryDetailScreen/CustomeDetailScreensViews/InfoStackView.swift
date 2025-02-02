//
//  InfoStackView.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import SwiftUI

struct InfoStackView: View {
    
    @State var country: CountryModel
    
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            VStack {
                InfoItemView(title: "Capital:", description: country.capital?.joined(separator: ", ") ?? "No capital")
                InfoItemView(title: "Population:", description: String(country.population))
                InfoItemView(title: "Area:", description: String(country.area))
                InfoItemView(title: "Currency:", description: country.currencies?.map { "\($0.value.name) (\($0.value.symbol))" }.joined(separator: "; ") ?? "No currency information available")
                InfoItemView(title: "Languages:", description: country.languages?.map {"\($0.value)"}.joined(separator: "; ") ?? "No currency information available")
                InfoItemView(title: "Timezone:", description: country.timezones.map {"\($0)"}.joined(separator: "; "))
                InfoItemView(title: "Coordinates:", description: country.latlng.map {"\($0)"}.joined(separator: ", "))
            }
            .padding(.horizontal, 12)
            .padding(.top, 50)
        }
        .mask(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.0),
                    Color.black.opacity(1.0),
                    Color.black.opacity(1.0),
                    Color.black.opacity(1.0),
                    Color.black.opacity(1.0),
                    Color.black.opacity(1.0),
                    Color.black.opacity(0.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}
