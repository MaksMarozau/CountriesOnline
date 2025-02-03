//
//  CountryDetailViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import MapKit


final class CountryDetailViewModel: ObservableObject {
    @Published var isShowMap = false
    @Published var isFavorite = false
    
    
    private func addToFavorites(by cca3Code: String) {
        do {
            try CoreDataService.shared.saveCca3Code(cca3Code: cca3Code)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deletFromFavorites(by cca3Code: String) {
        do {
            try CoreDataService.shared.deleteCca3Code(cca3Code: cca3Code)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func loadFavorites() async -> [String] {
        do {
            let result = try await CoreDataService.shared.loadCca3Codes()
            return result
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func mapShowToggle() {
        isShowMap.toggle()
    }
    
    func favoriteStatusToggle(by cca3Code: String) {
        if isFavorite {
            deletFromFavorites(by: cca3Code)
            isFavorite = false
        } else {
            addToFavorites(by: cca3Code)
            isFavorite = true
        }
    }
    
    
    func isFavoriteStatusChecking(by cca3Code: String) async {
        let favoritesArray = await loadFavorites()
        if favoritesArray.contains(cca3Code) {
            DispatchQueue.main.async {
                self.isFavorite = true
            }
        } else {
            DispatchQueue.main.async {
                self.isFavorite = false
            }
        }
    }
}
