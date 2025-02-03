//
//  CountriesListView.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import SwiftUI

struct CountriesListView<ViewModel: CountriesListProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    var canDelete: Bool
    
    var body: some View {
        List {
            ForEach(viewModel.countriesToShowArray) { country in
                Button {
                    viewModel.selectedCountry = country
                } label: {
                    CountryCellItem(country: country)
                }
            }
            .onDelete(perform: canDelete ? delete : nil)
            .listRowSeparator(.hidden)
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
    
    private func delete(at offsets: IndexSet) {
            Task {
                for index in offsets {
                    let country = viewModel.countriesToShowArray[index]
                    try await viewModel.removeCountry(country: country)
                }
                // Удалим страну из отображаемого массива
                withAnimation {
                    viewModel.countriesToShowArray.remove(atOffsets: offsets)
                }
            }
        }
}

#Preview {
    let viewModel = CountriesViewModel()
    CountriesListView(viewModel: viewModel, canDelete: false)
}
