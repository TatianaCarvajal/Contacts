//
//  Untitled.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation

struct Contact: Codable {
    let name: String
    let id: Int
    let companyName: String
    var isFavorite: Bool
    let smallImageURL: String
    let largeImageURL: String
    let emailAddress: String
    let birthdate: String
    let phone: Phone
    let address: Address
}

struct Phone: Codable {
    let work: Int?
    let home: Int?
    let mobile: Int?
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let country: String
    let zipCode: String
}
