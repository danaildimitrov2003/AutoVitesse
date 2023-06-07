//
//  SignInForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import SwiftUI
import RealmSwift
import FBSDKLoginKit

struct SignInFormView: View {
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var appSession: AppSession
    @State var errorMessage = ""
    @State var showHomeView = false
    @State var showFacebookSignUp = false
    @State var manager = LoginManager()
    
    var body: some View {
        NavigationView{
            List {
                TextField("Username", text: $username)
                    .disableAutocorrectAndAutocapitalize()
                SecureField("Password", text: $password)
                if(errorMessage != ""){
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                FacebookButton(buttonText: "Sign in with Facebook", showHomeView: $showHomeView, showFacebookSignUp: $showFacebookSignUp)
            }
            .navigationTitle("Sign in")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Sign in") {
                        signIn(username: username, password: password)
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

struct SignInForm_Previews: PreviewProvider {
    static var previews: some View {
        SignInFormView()
    }
}
