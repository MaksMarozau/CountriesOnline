//
//  CoreDataService.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import Foundation
import CoreData


//MARK: - Final class CoreDataService
final class CoreDataService {
    
    //Singleton pattern implemendation
    static let shared = CoreDataService()
    private init() { }
    
    //MARK: - Computed properties
    //Persistent container getting
    private var persistentContainer: NSPersistentContainer {
        let container = PersistenceController.shared.container
        return container
    }
    
    //ViewContext getting
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    //MARK: Methods of class
    //Cache data method. Save the countries as a binary data file
    func cacheCounrtiesData(counrtiesData: Data) async throws {
        try await viewContext.perform {
            let fetchRequest = NSFetchRequest<CachedCountriesEntity>(entityName: "CachedCountriesEntity")
            
            do {
                //Attempt to load data to check if there is in a cache
                let results = try self.viewContext.fetch(fetchRequest)
                
                //if there is in a cach, then resave data
                if let entity = results.first {
                    entity.cachedData = counrtiesData
                    
                //if there isn't in a cache, then create new entity to save data
                } else {
                    let newEntity = CachedCountriesEntity(context: self.viewContext)
                    newEntity.cachedData = counrtiesData
                }
                
                //save context with data
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
    
    
    //Save country's id as cca3 code to implemented favorite countries storage
    func saveCca3Code(cca3Code: String) throws {
        let fetchRequest = NSFetchRequest<FavoritCountriesEntity>(entityName: "FavoritCountriesEntity")
        fetchRequest.predicate = NSPredicate(format: "cca3Code == %@", cca3Code)
        
        do {
            //Attempt to load code to check if its was saved early
            let results = try self.viewContext.fetch(fetchRequest)
            
            //If code wasn't save, then create new entity to save current code
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
    
    
    //Cached countries loading as a binary data type
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
    
    
    //Load cca3-codes array to implemented favorite countries function
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
    
    
    //Delete cca3-code to implemented favorite countries delete function
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
