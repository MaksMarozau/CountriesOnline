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
                TextFieldCustomeView(viewModel: viewModel)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Loading...")
                    Spacer()
                    
                } else {
                    CountriesListView(viewModel: viewModel)
                        .padding(.top, 12)
                        .navigationDestination(item: $viewModel.selectedCountry) { country in
                            CountryDetailView(country: country)
                        }
                }
            }
            .alert("Error", isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil })
            ){
                Button("Ok", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "Unknowned Error")
            }
            .task {
                await viewModel.fetchCountries()
            }
        }
    }
}

#Preview {
    CountriesView()
}
