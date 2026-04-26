//
//  ContactDetailView.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 24/04/26.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: Contact
    
    var body: some View {
        VStack {
            List {
                AsyncImage(url: contact.largeImageUrl ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                } placeholder: {
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .padding(.horizontal, 100)
                
                Section("Info") {
                    Text(contact.name)
                        .font(.title3)
                    if let company = contact.companyName {
                        Text("Company: \(company)")
                    }
                    Text(contact.emailAddress)
                    Text(contact.birthdate)
                }
                
                Section("Phone") {
                    if let mobile = contact.phone.mobile {
                        Text("Mobile: \(mobile)")
                    }
                    if let work = contact.phone.work {
                        Text("Work: \(work)")
                    }
                    if let home = contact.phone.home {
                        Text("Home: \(home)")
                    }
                }
                
                Section("Address") {
                    Text(contact.address.street)
                    Text("\(contact.address.city), \(contact.address.state)")
                    Text(contact.address.country)
                    Text(contact.address.zipCode)
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

