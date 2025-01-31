//
//  CountryDetailView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI
import Kingfisher

struct CountryDetailView: View {
    @State var country: CountryModel
    @State private var svgFlagImage: UIImage?
    
    var body: some View {
        VStack {
            Text(country.name.official)
                .font(.system(size: 36, weight: .black))
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 12)
            
            KFImage(URL(string: country.flags.png))
                .placeholder({ _ in
                    ProgressView("Flag is in loading process...")
                })
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 330, maxHeight: 220)
                .cornerRadius(10)
                .shadow(color: .customeGray, radius: 15, y: 5)
                .padding(.horizontal, 12)
            
            Spacer()
            
            InfoView(title: "Capital:", description: country.capital?.joined(separator: ", ") ?? "No capital")
            InfoView(title: "Population:", description: String(country.population))
            InfoView(title: "Area:", description: String(country.area))
            InfoView(title: "Currency:", description: country.currencies?.map { "\($0.value.name) (\($0.value.symbol))" }.joined(separator: "; ") ?? "No currency information available")
            InfoView(title: "Languages:", description: country.languages?.map {"\($0.value)"}.joined(separator: "; ") ?? "No currency information available")
            InfoView(title: "Timezone:", description: country.timezones.map {"\($0)"}.joined(separator: "; "))
            InfoView(title: "Coordinates:", description: country.latlng.map {"\($0)"}.joined(separator: ", "))
        }
        .padding(.vertical, 20)
        .navigationTitle("About \(country.name.common)")
    }
}

#Preview {
    let country = CountryModel(
            name: CountryName(common: "Belarus", official: "Republic of Belarus"),
            cca2: "BL", cca3: "BLR", region: "Europe", subregion: "East Europe",
            population: 9200000,
            flags: CountryFlags(png: "https://flagcdn.com/w320/aw.png", svg: "https://flagcdn.com/aw.svg"),
            capital: ["Minsk"], area: 912345,
            currencies: ["BYN" : Currency(name: "ruble", symbol: "p.")],
            languages: ["BLR" : "Belarusian"],
            timezones: ["UTC + 2"],
            latlng: [52.52, 13.4]
        )
    CountryDetailView(country: country)
}
