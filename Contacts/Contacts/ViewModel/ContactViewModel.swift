//
//  ContactViewModel.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation
import Combine

struct ContactList {
    var favorites: [Contact]
    var unfavorites: [Contact]
}

class ContactViewModel: ObservableObject {
    let service: ServiceRepository
    
    @Published var states: ViewState = .loading
    
    init(service: ServiceRepository) {
        self.service = service
    }
    
    enum ViewState {
        case loading
        case success(ContactList)
        case failure
    }
    
    func getAllContacts() async {
        states = .loading
        do {
            let contacts = try await service.fetchContacts()
            let favorites = contacts.filter { $0.isFavorite == true }
            let unfavorites = contacts.filter { $0.isFavorite == false }
            states = .success(ContactList(favorites: favorites, unfavorites: unfavorites))
        } catch {
            states = .failure
        }
    }
}
