//
//  CountryDetailViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import MapKit


final class CountryDetailViewModel: ObservableObject {
    @Published var isShowMap = false
    
    func mapButtonTapped() {
        isShowMap.toggle()
    }
}
