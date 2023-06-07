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
    @State var showFacebookSignUp = false
    
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
                .foregroundColor(Color("TextColor"))
                TextField("City", text: $city)
                    .disableAutocorrectAndAutocapitalize()
                    .foregroundColor(Color("TextColor"))
                Toggle(isOn: $isEmailConfirmed) {
                    Text("I confirm that this is my email")
                }
                .foregroundColor(Color("TextColor"))
                .tint(Color("AccentColor"))
                if(errorMessage != ""){
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                FacebookButton(buttonText: "Sign up with Facebook", showHomeView: $showHomeView, showFacebookSignUp: $showFacebookSignUp)
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
                NavbarContainerView(currentViewName: "Home"){
                    HomeView()
                }
            }
            .sheet(isPresented: $showFacebookSignUp) {
                FacebookSignUpView()
            }
        }
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(user: User())
    }
}
