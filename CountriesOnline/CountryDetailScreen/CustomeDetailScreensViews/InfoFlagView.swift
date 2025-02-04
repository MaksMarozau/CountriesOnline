//
//  InfoFlagView.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import SwiftUI
import Kingfisher


struct InfoFlagView: View {
    
    //MARK: - Properties
    @State var country: CountryModel
    
    //MARK: - Body of main view
    var body: some View {
        VStack {
            Text(country.name.official)
                .font(.system(size: 36, weight: .black))
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .frame(maxWidth: .infinity, alignment: .center)
            
            //Use Kingfisher to load and cache flag images
            KFImage(URL(string: country.flags.png))
                .placeholder({ _ in
                    ProgressView("Flag is in loading process...")
                })
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 330, maxHeight: 220)
                .cornerRadius(10)
                .shadow(color: .customeGray, radius: 15, y: 5)
        }
        .padding(.horizontal, 12)
    }
}
