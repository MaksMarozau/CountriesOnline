//
//  FooterButtonsView.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import SwiftUI

struct FooterButtonsView: View {
    
    @State private var isFavorite: Bool = false
    @State var country: CountryModel
    @StateObject var viewModel: CountryDetailViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                Button {
                    isFavorite.toggle()
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 8)
                    }
                }
            }
            
            Spacer()
            
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                Button {
                    viewModel.mapButtonTapped()
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.bottom, 8)
                    }
                }
            }
            
            Spacer()
            
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                ShareLink(item: "Check out this amazing country: \(country.name.common), coordinates: \(country.latlng)") {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: "shared.with.you")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                            .padding(.bottom, 8)
                    }
                }
            }
        }
        .padding(.horizontal, 50)
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
    let viewModel = CountryDetailViewModel()
    FooterButtonsView(country: country, viewModel: viewModel)
}
