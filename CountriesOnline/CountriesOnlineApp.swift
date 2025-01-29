//
//  CountriesOnlineApp.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

@main
struct CountriesOnlineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
