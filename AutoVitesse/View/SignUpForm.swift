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
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var country = ""
    @State private var city = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $username)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Confirm Password", text: $confirmPassword)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                Picker("Country", selection: $country) {
                    ForEach(countries, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                TextField("City", text: $city)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Sign Up") {
                        if(password == confirmPassword){
                            signUp(username: username, email: email, password: password, country: country, city: city)
                        }
                    }
                    //.disabled(true)
                }
            }
        }
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(user: User())
    }
}
