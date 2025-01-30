//
//  CountryCellItem.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountryCellItem: View {
    
    let country: CountryModel
    
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
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(country.region)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 9)
                
                
                Spacer()
                
                AsyncImage(url: URL(string: country.flags.png)) { status in
                    switch status {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    )
                            .frame(width: 80, height: 50)
                            .padding(.trailing, 22)
                            .padding(.bottom, 9)
                        
                            
                    case .failure:
                        Image(systemName: "flag.fill")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .padding(.trailing, 22)
                            .padding(.bottom, 9)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    let country = CountryModel(name: CountryName(common: "Belarus", official: "Republic of Belarus"), cca2: "BL", cca3: "BLR", region: "Europe", subregion: "East Europe", population: 9200000, flags: CountryFlags(png: "https://flagcdn.com/w320/aw.png", svg: "https://flagcdn.com/aw.svg"))
    CountryCellItem(country: country)
}
