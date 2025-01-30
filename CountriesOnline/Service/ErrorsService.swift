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

enum CoreDataErrorService: Error {
    case initCoreDataError
    case entityError
    case saveError
    case castError
    case loadError
    case objectNotFoundError
    case updateTaskStatusError
    case fetchEntityCountError
}
