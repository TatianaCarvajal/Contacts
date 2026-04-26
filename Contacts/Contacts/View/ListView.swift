//
//  ContentView.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 23/04/26.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ContactViewModel(service: ServiceRepositoryImpl())
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.states {
                case .loading:
                    ProgressView()
                case .success(let response):
                    List {
                        Section {
                            ForEach(response.favorites) { contact in
                                NavigationLink(value: contact) {
                                    ContactView(contact: contact)
                                }
                            }
                        } header: {
                            Text("Favorites")
                                .font(.title)
                        }
                        Section {
                            ForEach(response.unfavorites) { contact in
                                NavigationLink(value: contact) {
                                    ContactView(contact: contact)
                                }
                            }
                        } header: {
                            Text("Contacts")
                                .font(.title)
                        }
                    }
                case .failure:
                    Text("Error")
                }
            }
            .task {
                await viewModel.getAllContacts()
            }
            .navigationDestination(for: Contact.self) { contact in
                ContactDetailView(contact: contact)
            }
        }
    }
}

#Preview {
    ListView(viewModel: ContactViewModel(service: ServiceRepositoryImpl()))
}
