//
//  facebookSignUpView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 7.06.23.
//

import SwiftUI

struct FacebookSignUpView: View {
    let utils = Utils()
    @State var email : String
    @State var username = ""
    @State var country = ""
    @State var city = ""
    @State var errorMessage = ""
    @State var isUsernameCompleted = false
    @State var showHomeView = false
    
    init() {
        email = utils.getCurrentUser().email
    }
    var body: some View {
        NavigationView {
            ZStack {
                //Color.purple.ignoresSafeArea()
                Form {
                    TextField("Email", text: $email)
                        .disableAutocorrectAndAutocapitalize()
                        .disabled(true)
                        .foregroundColor(.gray)
                    UsernameTextField(username: $username, usernameState: username, errorMessage: $errorMessage, isUsernameCompleted: $isUsernameCompleted)
                    Picker("Country", selection: $country) {
                        ForEach(countries, id: \.self) { option in
                            Text("\(option)")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                    TextField("City", text: $city)
                        .disableAutocorrectAndAutocapitalize()
                        .foregroundColor(Color("TextColor"))
                    .foregroundColor(Color("TextColor"))
                    .tint(Color("AccentColor"))
                    if(errorMessage != ""){
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                //.background(Color("BackgroundColor"))
                .navigationTitle("Facebook Sign Up")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Sign Up") {
                            handleSignUpButton()
                        }
                        //.disabled(true)
                    }
                }
                .fullScreenCover(isPresented: $showHomeView) {
                    NavbarContainerView(currentViewName: "Home"){
                        HomeView()
                    }
            }
            }
        }
        
    }
}

struct facebookSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookSignUpView()
    }
}
