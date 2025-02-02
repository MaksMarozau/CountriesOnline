//
//  ErrorsService.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import Foundation

enum NetworkErrorService: String, Error {
    case badURL
    case badRequest
    case badResponce
    case invalidData
}

enum InthernetConectionErrorService: String, Error {
    case noInternetConnectionWithCache = "Data was loaded from cache"
    case noInternetConnectionWithoutCache = "No internet connection. No data in cache"
}

enum CoreDataErrorService: String, Error {
    case cacheDataError
    case entityCreationError
    case saveDataError
    case castDataError
    case loadDataError
    case noDataError 
    
    case initCoreDataError

    case objectNotFoundError
    case updateError
    case fetchEntityCountError
}
