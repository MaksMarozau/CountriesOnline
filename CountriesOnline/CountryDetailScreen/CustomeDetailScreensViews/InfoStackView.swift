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
                InfoItemView(title: NSLocalizedString("Capital:", comment: ""), description: country.capital?.joined(separator: ", ") ?? NSLocalizedString("No capital", comment: ""))
                InfoItemView(title: NSLocalizedString("Population:", comment: ""), description: String(country.population))
                InfoItemView(title: NSLocalizedString("Area:", comment: ""), description: String(country.area))
                InfoItemView(title: NSLocalizedString("Currency:", comment: ""), description: country.currencies?.map { "\($0.value.name) (\($0.value.symbol))" }.joined(separator: "; ") ?? NSLocalizedString("No currency information available", comment: ""))
                InfoItemView(title: NSLocalizedString("Languages:", comment: ""), description: country.languages?.map {"\($0.value)"}.joined(separator: "; ") ?? NSLocalizedString("No currency information available", comment: ""))
                InfoItemView(title: NSLocalizedString("Timezone:", comment: ""), description: country.timezones.map {"\($0)"}.joined(separator: "; "))
                InfoItemView(title: NSLocalizedString("Coordinates:", comment: ""), description: country.latlng.map {"\($0)"}.joined(separator: ", "))
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
