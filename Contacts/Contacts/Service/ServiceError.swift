//
//  ServiceError.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation

enum ServiceError: Error, LocalizedError {
    case inValidURL
    case noDataFound
    
    var errorDescription: String? {
        switch self {
        case .inValidURL: "Invalid URL"
        case .noDataFound: "No data found"
        }
    }
}
