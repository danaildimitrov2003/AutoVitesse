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
    @ObservedResults(
    User.self,
      where: { $0.id == appSession.currentUser!.id }
    ) var user
    //@State var user = appSession.currentUser
    var body: some View {
        VStack{
            Label(user[0].username , systemImage: "person.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            Label(user[0].email , systemImage: "envelope.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            Label(user[0].country , systemImage: "globe.europe.africa.fill")
                .font(.title)
                .foregroundColor(Color("TextColor"))
            if(user[0].city != "" ){
                Label(user[0].city , systemImage: "mappin")
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
