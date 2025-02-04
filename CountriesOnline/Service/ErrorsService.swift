//
//  ErrorsService.swift
//  CountriesOnline
//
//  Created by Maks on 30.01.25.
//

import Foundation

//To processing Network errors
enum NetworkErrorService: String, Error {
    case badURL
    case badRequest
    case badResponce
    case invalidData
}

//To processing cases when the internet connection is absend. We have 2 cases: with cased data and without
enum InthernetConectionErrorService: String, Error {
    case noInternetConnectionWithCache = "Data was loaded from cache"
    case noInternetConnectionWithoutCache = "No internet connection. No data in cache"
}

//To processing CoreData errors
enum CoreDataErrorService: String, Error {
    case cacheDataError
    case entityCreationError
    case saveDataError
    case castDataError
    case loadDataError
    case noDataError 
}
