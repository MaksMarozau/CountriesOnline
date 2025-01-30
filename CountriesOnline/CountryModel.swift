//
//  CountryModel.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountryModel: Identifiable, Codable, Hashable {
    var id: String { cca3 }
    let name: CountryName
    let cca2: String
    let cca3: String
    let region: String
    let subregion: String?
    let population: Int
    let flags: CountryFlags
}

struct CountryName: Codable, Hashable {
    let common: String
    let official: String
}

struct CountryFlags: Codable, Hashable {
    let png: String
    let svg: String
}
