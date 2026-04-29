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

@MainActor
class ContactViewModel: ObservableObject {
    let service: ServiceRepository
    var firstCall: Bool = false
    
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
        guard firstCall == false else {
            return
        }
        states = .loading
        do {
            let contacts = try await service.fetchContacts()
            let favorites = contacts.filter { $0.isFavorite == true }
            let unfavorites = contacts.filter { $0.isFavorite == false }
            states = .success(ContactList(favorites: favorites, unfavorites: unfavorites))
        } catch {
            states = .failure
        }
        firstCall = true
    }
    
    func getContactById(id: String) -> Contact {
        if case let .success(contactList) = states {
            if let contact = contactList.favorites.first(where: { $0.id == id }) {
                return contact
            }
            if let contact = contactList.unfavorites.first(where: { $0.id == id }) {
                return contact
            }
        }
        fatalError("This shouldn’t happen")
    }
    
    func reloadList(contact: Contact) {
        if case let .success(contactList) = states {
            var currentFavorite = contactList.favorites
            var currentUnfavorite = contactList.unfavorites
            
            currentFavorite.removeAll { $0.id == contact.id }
            currentUnfavorite.removeAll { $0.id == contact.id }
            
            if contact.isFavorite {
                currentFavorite.append(contact)
            } else {
                currentUnfavorite.append(contact)
            }
            
            states = .success(ContactList(favorites: currentFavorite, unfavorites: currentUnfavorite))
        }
    }
}
