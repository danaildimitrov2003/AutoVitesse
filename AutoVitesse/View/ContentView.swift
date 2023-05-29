//
//  ContentView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State private var isSignUpFormViewActive = false
    @State private var isSignInFormViewActive = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundColor"), Color("PrimaryGreen")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea(.all)
            VStack {
                Text("Welcome to AutoVitesse!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("TextColor"))
                Image("CarLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140.0, height: 140.0)
                Button(action: {isSignInFormViewActive = true}) {
                    Text("Sign In")
                        .padding()
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("WhiteTextColor"))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isSignInFormViewActive) {
                    SignInFormView()
                }
                Button(action: {
                    isSignUpFormViewActive = true
                }) {
                    Text("Sign Up")
                        .padding()
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("WhiteTextColor"))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isSignUpFormViewActive) {
                    SignUpFormView(user: User())
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
