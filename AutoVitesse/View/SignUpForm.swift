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
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var country = ""
    @State var city = ""
    @State var isEmailConfirmed = false
    @State var errorMessage = ""
    //@State var isUsernameCompleted = false
    @State var isEmailCompleted = false
    @State var isPasswordCompleted = false
    @State var isConfirmPasswordCompleted = false
    //@State var isCountryCompleted = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $username)
                    .disableAutocorrectAndAutocapitalize()
                TextField("Email", text: $email)
                    .disableAutocorrectAndAutocapitalize()
                    .onChange(of: email) { newValue in
                        handleEmailChange(email)
                    }
                SecureField("Password", text: $password)
                    .onChange(of: password){ newValue in
                        handlePasswordChange(password)
                    }
                SecureField("Confirm Password", text: $confirmPassword)
                    .onChange(of: confirmPassword){ newValue in
                        handleConfirmPasswordChange(password, confirmPassword)
                    }
                Picker("Country", selection: $country) {
                    ForEach(countries, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                TextField("City", text: $city)
                    .disableAutocorrectAndAutocapitalize()
                Toggle(isOn: $isEmailConfirmed) {
                    Text("I confirm that this is my email")
                }
                if(errorMessage != ""){
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Sign Up") {
                        handleSubmitButton()
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
