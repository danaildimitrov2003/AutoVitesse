//
//  SignInForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import SwiftUI
import RealmSwift

struct SignInFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    @ObservedRealmObject var user: User
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Username", text: $user.username)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Password", text: $user.password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .navigationTitle("Sign in")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Sign in") {
                        
                    }
                    //.disabled(true)
                }
            }
        }
    }
}

struct SignInForm_Previews: PreviewProvider {
    static var previews: some View {
        SignInFormView(user: User())
    }
}
