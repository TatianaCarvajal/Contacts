//
//  ContactView.swift
//  Contacts
//
//  Created by Tatiana Carvajal on 24/04/26.
//

import SwiftUI

struct ContactView: View {
    var contact: Contact
    var body: some View {
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
            
            Spacer()
            
            if contact.isFavorite == true {
                Image(systemName: "heart.fill")
            } else {
                Image(systemName: "heart")
            }
        }
    }
}


