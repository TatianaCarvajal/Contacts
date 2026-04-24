//
//  Untitled.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation

struct Contact: Codable, Identifiable{
    let name: String
    let id: String
    let companyName: String?
    var isFavorite: Bool
    let smallImageURL: String
    let largeImageURL: String
    let emailAddress: String
    let birthdate: String
    let phone: Phone
    let address: Address
    
    var smallImageUrl: URL? {
        return URL(string: smallImageURL)
    }
    
    var largeImageUrl: URL? {
        return URL(string: largeImageURL)
    }
}

struct Phone: Codable {
    let work: String?
    let home: String?
    let mobile: String?
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let country: String
    let zipCode: String
}
