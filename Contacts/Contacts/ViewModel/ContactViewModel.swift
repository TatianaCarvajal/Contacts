//
//  ContactViewModel.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import Foundation
import Combine

class ContactViewModel: ObservableObject {
    let service: ServiceRepository
    
    @Published var states: ViewState = .loading
    
    init(service: ServiceRepository) {
        self.service = service
    }
    
    enum ViewState {
        case loading
        case success([Contact])
        case failure
    }
    
    func getAllContacts() async {
        states = .loading
        do {
            let contacts = try await service.fetchContacts()
            states = .success(contacts)
        } catch {
            states = .failure
        }
    }
}
