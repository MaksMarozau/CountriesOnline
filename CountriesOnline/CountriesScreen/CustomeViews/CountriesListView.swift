//
//  CountriesListView.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import SwiftUI

struct CountriesListView: View {
    
    @StateObject var viewModel: CountriesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.countriesToShowArray) { country in
                Button {
                    viewModel.selectedCountry = country
                } label: {
                    CountryCellItem(country: country)
                }
            }
            .listRowSeparator(.hidden)
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    let viewModel = CountriesViewModel()
    CountriesListView(viewModel: viewModel)
}
