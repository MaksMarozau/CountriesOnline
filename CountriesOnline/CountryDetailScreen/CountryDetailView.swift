//
//  CountryDetailView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI
import CoreLocation


struct CountryDetailView: View {
    
    //MARK: - Properties
    @State var country: CountryModel
    @State private var svgFlagImage: UIImage?
    @StateObject private var viewModel = CountryDetailViewModel()
    
    //MARK: - Body of main view
    var body: some View {
        VStack {
            InfoFlagView(country: country)
            
            InfoStackView(country: country)
                .padding(.top, -10)
                .padding(.bottom, 10)
            
            FooterButtonsView(country: country, viewModel: viewModel)
        }
        .padding(.vertical, 20)
        .navigationTitle("About \(country.name.common)")
        
        //Sheet with country's location displaying on the custome map
        .sheet(isPresented: $viewModel.isShowMap) {
            MapView(coordinates: CLLocationCoordinate2D(latitude: country.latlng[0], longitude: country.latlng[1]), countryName: country.name.common, viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
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
    CountryDetailView(country: country)
}
