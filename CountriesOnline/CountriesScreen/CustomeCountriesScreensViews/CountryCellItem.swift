//
//  CountryCellItem.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI
import Kingfisher


//MARK: - Custome Cell for List
struct CountryCellItem: View {
    
    //MARK: - Properties
    let country: CountryModel
    @State private var isFlagLoaded: Bool = false
    
    //MARK: - Body of main view
    var body: some View {
        ZStack {
            Color(.customeGray)
                .frame(height: 90)
                .cornerRadius(15)
                .shadow(color: .customeGray, radius: 7, y: 5)
            
            Color(.white)
                .frame(height: 80)
                .cornerRadius(15)
                .padding(.bottom, 9)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(country.name.common)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(country.region)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.customeGray)
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 9)
                
                Spacer()
                
                //Adding a flag image with the Kingfisher to load and cache it
                KFImage(URL(string: country.flags.png))
                    .placeholder {
                        ProgressView()
                    }
                    .onSuccess({ _ in
                        isFlagLoaded = true
                    })
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isFlagLoaded ? Color.black : Color.clear, lineWidth: 1)
                    )
                    .frame(width: 80, height: 50)
                    .padding(.trailing, 22)
                    .padding(.bottom, 9)
            }
        }
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
    CountryCellItem(country: country)
}
