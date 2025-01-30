//
//  CountriesView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountriesView: View {
    
    @StateObject var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextFieldCustomeView()
                
                List {
                    ForEach(viewModel.countries) { country in
                        Button {
                            viewModel.selectedCountry = country
                        } label: {
                            CountryCellItem(country: country)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .task {
                    await viewModel.fetchCountries()
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                .padding(.top, 12)
                
                .navigationDestination(item: $viewModel.selectedCountry) { country in
                    CountryDetailView(country: country)
                }
            }
        }
    }
}

#Preview {
    CountriesView()
}
