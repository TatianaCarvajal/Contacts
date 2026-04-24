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
                        ForEach(response) { contact in
                            HStack {
                                AsyncImage(url: contact.smallImageUrl) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 90)
                                        .cornerRadius(20)
                                } placeholder: {
                                    Image(systemName: "photo.badge.exclamationmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 90)
                                }
                                
                                Text(contact.name)
                                    .font(.system(size: 25, weight: .bold))
                                    .padding(.leading, 30)
                            }
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
