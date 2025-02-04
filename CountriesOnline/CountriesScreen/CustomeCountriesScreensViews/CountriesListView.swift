//
//  CountriesListView.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import SwiftUI

//MARK: - List as generic struct to reuse its
struct CountriesListView<ViewModel: CountriesListProtocol>: View {
    
    //MARK: - Properties
    @StateObject var viewModel: ViewModel
    var canDelete: Bool
    
    //MARK: - Body of main view
    var body: some View {
        List {
            ForEach(viewModel.countriesToShowArray) { country in
                Button {
                    viewModel.selectedCountry = country
                } label: {
                    CountryCellItem(country: country)
                }
            }
            
            //impelemendat the delete function for List's cell if it needs.
            .onDelete(perform: canDelete ? delete : nil)
            .listRowSeparator(.hidden)
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
    
    //Delete list's cell method with simple animation
    private func delete(at offsets: IndexSet) {
        Task {
            for index in offsets {
                let country = viewModel.countriesToShowArray[index]
                try await viewModel.removeCountry(country: country)
            }
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
