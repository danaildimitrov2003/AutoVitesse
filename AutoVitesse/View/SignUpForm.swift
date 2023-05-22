//
//  SignUpForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift

struct SignUpFormView: View {
    @ObservedRealmObject var user: User
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var country = ""
    @State var city = ""
    @State var isEmailConfirmed = false
    @State var errorMessage = ""
    @State var isUsernameCompleted = false
    @State var isEmailCompleted = false
    @State var isPasswordCompleted = false
    @State var isConfirmPasswordCompleted = false
    @State var showHomeView = false
    //@State var isCountryCompleted = false
    
    var body: some View {
        NavigationView {
            Form {
                UsernameTextField(username: $username, usernameState: username, errorMessage: $errorMessage, isUsernameCompleted: $isUsernameCompleted)
                EmailTextField(email: $email, emailState: email, errorMessage: $errorMessage, isEmailCompleted: $isEmailCompleted)
                PasswordTextField(password: $password, errorMessage: $errorMessage, isPasswordCompleted: $isPasswordCompleted)
                ConfirmPasswordTextField(password: $password, confirmPassword: $confirmPassword, errorMessage: $errorMessage, isConfirmPasswordCompleted: $isConfirmPasswordCompleted)
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
            .fullScreenCover(isPresented: $showHomeView) {
                NavbarContainerView{
                    HomeView()
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
