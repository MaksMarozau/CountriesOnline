//
//  CountriesView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountriesView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = CountriesViewModel()
    
    //MARK: - Body of main view
    var body: some View {
        NavigationStack {
            VStack {
                TextFieldCustomeView(viewModel: viewModel)
                
                //show ProgressIndicator before data will load
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Loading...")
                    Spacer()
                    
                //after data was loaded show List with countries
                } else {
                    CountriesListView(viewModel: viewModel, canDelete: false)
                        .padding(.top, 12)
                        .navigationDestination(item: $viewModel.selectedCountry) { country in
                            CountryDetailView(country: country)
                        }
                }
            }
            
            //Alert with errors processing implemendation
            .alert("Error", isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil })
            ){
                Button("Ok", role: .cancel) {
                    viewModel.isLoading = false
                }
            } message: {
                Text(viewModel.errorMessage ?? "Unknowned Error")
            }
            
            //Life cycle methods
            .onAppear() {
                Task {
                    await viewModel.fetchCountries()
                }
            }
        }
    }
}


#Preview {
    CountriesView()
}
