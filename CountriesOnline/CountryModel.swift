//
//  CountryModel.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountryModel: Identifiable {
    let id = UUID()
    let name: String
    let flag: UIImage
    let region: String
}
