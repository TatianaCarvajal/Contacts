//
//  ContentView.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import SwiftUI

struct ContactsView: View {
    @StateObject var viewModel = ContactViewModel(service: ServiceRepositoryImpl())
    
    var body: some View {
        VStack {
            switch viewModel.states {
            case .loading:
                ProgressView()
            case .success(let response):
                List {
                    Section {
                        ForEach(response.favorites) { contact in
                            ContactView(contact: contact)
                        }
                    } header: {
                        Text("Favorites")
                            .font(.title)
                    }
                    Section {
                        ForEach(response.unfavorites) { contact in
                            ContactView(contact: contact)
                        }
                    } header: {
                        Text("Contacts")
                            .font(.title)
                    }
                }
            case .failure:
                Text("Asi no es")
            }
        }
        .task {
            await viewModel.getAllContacts()
        }
    }
}

#Preview {
    ContactsView(viewModel: ContactViewModel(service: ServiceRepositoryImpl()))
}
