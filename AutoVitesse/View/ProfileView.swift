//
//  ProfileView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        VStack{
            Label(appSession.currentUser?.username ?? "username", systemImage: "person.fill")
                .font(.title)
            Label(appSession.currentUser?.email ?? "email", systemImage: "envelope.fill")
                .font(.title)
            Label(appSession.currentUser?.country ?? "country", systemImage: "globe")
                .font(.title)
            if(appSession.currentUser?.city != "" ){
                Label(appSession.currentUser?.city ?? "city", systemImage: "mappin")
                    .font(.title)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
