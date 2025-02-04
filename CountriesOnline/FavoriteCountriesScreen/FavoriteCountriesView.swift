//
//  FavoriteCountriesView.swift
//  CountriesOnline
//
//  Created by Maks on 3.02.25.
//

import SwiftUI


struct FavoriteCountriesView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = FavoriteCountriesViewModel()
    @State var countriesArray: [CountryModel]
    
    //MARK: - Body of main view
    var body: some View {
        VStack {
            
            //show ProgressIndicator before data will load
            if viewModel.isLoading {
                Spacer()
                ProgressView("Loading...")
                Spacer()
                
                //after data was loaded show List with countries
            } else {
                CountriesListView(viewModel: viewModel, canDelete: true)
                    .padding(.top, 12)
                    .navigationDestination(item: $viewModel.selectedCountry) { country in
                        CountryDetailView(country: country)
                    }
            }
        }
        .navigationTitle("Favorites")
        
        //Lifecicles methods
        .onAppear() {
            Task {
                await viewModel.fetchFavoriteCountries(where: countriesArray)
            }
        }
        .onDisappear() {
            viewModel.countriesToShowArray = []
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
    let array = [country, country, country]
    FavoriteCountriesView(countriesArray: array)
}
