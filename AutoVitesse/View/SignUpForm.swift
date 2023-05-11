//
//  SignUpForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift

struct SignUpFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var user: User
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $user.username)
                TextField("Email", text: $user.email)
                SecureField("Password", text: $user.password)
                SecureField("Confirm Password", text: $user.password)
                Picker("Country", selection: $user.country) {
                    ForEach(countries, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                TextField("City", text: $user.city)
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
              ToolbarItem(placement: .confirmationAction) {
                Button("Sign Up") {
                  save()
                }
                .disabled(true)
              }
            }
        }
    }
}

extension SignUpFormView {
    func save() {
        try? realm.write {
            realm.add(user)
        }
        dismiss()
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(user: User())
    }
}
