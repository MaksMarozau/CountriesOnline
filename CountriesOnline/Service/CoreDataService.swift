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
    
    
    func saveCca3Code(cca3Code: String) throws {
        let fetchRequest = NSFetchRequest<FavoritCountriesEntity>(entityName: "FavoritCountriesEntity")
        fetchRequest.predicate = NSPredicate(format: "cca3Code == %@", cca3Code)
        
        do {
            let results = try self.viewContext.fetch(fetchRequest)
            if results.isEmpty {
                let newEntity = FavoritCountriesEntity(context: viewContext)
                newEntity.cca3Code = cca3Code
                
                do {
                    try viewContext.save()
                } catch {
                    throw CoreDataErrorService.saveDataError
                }
            } else {
                throw CoreDataErrorService.entityCreationError
            }
        }
    }
    
    
    func loadСachedCountriesData() async throws -> Data {
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
    
    
    func loadCca3Codes() async throws -> [String] {
        try await viewContext.perform {
            let fetchRequest = NSFetchRequest<FavoritCountriesEntity>(entityName: "FavoritCountriesEntity")
            var cca3CodesArray = [String]()
            
            do {
                let result = try self.viewContext.fetch(fetchRequest)
                guard !result.isEmpty else {
                    throw CoreDataErrorService.noDataError
                }
                result.forEach({cca3CodesArray.append($0.cca3Code ?? "")})
                return cca3CodesArray
            } catch {
                throw CoreDataErrorService.loadDataError
            }
        }
    }
    
    
    func deleteCca3Code(cca3Code: String) throws {
        let fetchRequest: NSFetchRequest<FavoritCountriesEntity> = FavoritCountriesEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "cca3Code == %@", cca3Code)
        
        if let resultToDelete = try self.viewContext.fetch(fetchRequest).first {
            self.viewContext.delete(resultToDelete)
            
            do {
                try self.viewContext.save()
            } catch {
                throw CoreDataErrorService.saveDataError
            }
        }
    }
}
