//
//  ServiceRepositoryImpl.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation

struct ServiceRepositoryImpl: ServiceRepository {
    func fetchContacts() async throws -> [Contact] {
        guard let url = URL(string: "https://s3.amazonaws.com/technical-challenge/v3/contacts.json")
        else {
            throw ServiceError.inValidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Contact].self, from: data)
        return result
    }
}
