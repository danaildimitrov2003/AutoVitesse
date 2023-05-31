//
//  ProfileView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI
import RealmSwift

struct ProfileView: View {
    @State private var isEditFormActive = false
    @ObservedObject var user: User
    init() {
        guard let currentUser = appSession.currentUser else {
            user = User()
            return
        }
        user = currentUser
    }
    var body: some View {
        VStack{
            Label(user.username , systemImage: "person.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            Label(user.email , systemImage: "envelope.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            Label(user.country , systemImage: "globe.europe.africa.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            if(user.city != "" ){
                Label(user.city , systemImage: "mappin")
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
            }
            Button("Edit profile data") {
                isEditFormActive = true
            }
            .sheet(isPresented: $isEditFormActive) {
                EditForm(userEdit: setEditUser())
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
