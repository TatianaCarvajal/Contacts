//
//  ServiceProtocol.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation

protocol ServiceRepository {
    func fetchContacts() async throws -> [Contact]
}
