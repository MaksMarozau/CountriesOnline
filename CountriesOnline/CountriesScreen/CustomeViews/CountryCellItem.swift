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
                    Text(country.name)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text(country.region)
                        .font(.system(size: 19, weight: .semibold))
                }
                .padding(.leading, 22)
                .padding(.bottom, 9)
                
                
                Spacer()
                
                Image(uiImage: country.flag)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 22)
                    .padding(.bottom, 9)
            }
        }
    }
}

#Preview {
    let country = CountryModel(name: "Belarus", flag: UIImage(systemName: "flag")!, region: "Europe")
    CountryCellItem(country: country)
}
