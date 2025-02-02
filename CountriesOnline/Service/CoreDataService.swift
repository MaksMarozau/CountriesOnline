//
//  CoreDataService.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import Foundation
import CoreData


final class CoreDataService {
    
    static let shared = CoreDataService()
    
    private var persistentContainer: NSPersistentContainer {
        let container = PersistenceController.shared.container
        return container
    }
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    
    func cacheCounrtiesData(counrtiesData: Data) async throws {
        try await viewContext.perform {
            let fetchRequest = NSFetchRequest<CachedCountriesEntity>(entityName: "CachedCountriesEntity")
            
            do {
                let results = try self.viewContext.fetch(fetchRequest)
                if let entity = results.first {
                    entity.cachedData = counrtiesData
                } else {
                    let newEntity = CachedCountriesEntity(context: self.viewContext)
                    newEntity.cachedData = counrtiesData
                }
                
                do {
                    try self.viewContext.save()
                } catch {
                    throw CoreDataErrorService.saveDataError
                }
                
            } catch {
                throw CoreDataErrorService.entityCreationError
            }
        }
    }
    
    
    func loadcachedCountriesData() async throws -> Data {
        try await viewContext.perform {
            let fetchRequest = NSFetchRequest<CachedCountriesEntity>(entityName: "CachedCountriesEntity")
            
            do {
                let result = try self.viewContext.fetch(fetchRequest).first
                if let data = result?.cachedData {
                    return data
                } else {
                    throw CoreDataErrorService.noDataError
                }
            }
        }
    }
}
