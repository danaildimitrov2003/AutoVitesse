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
    @State private var signInAnimationAmount = 1.0
    @State private var logoAnimation = false
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
                    .offset(x: logoAnimation ? 0 : -UIScreen.main.bounds.width/1.3)
                VStack {
                    Button(action: { isSignInFormViewActive = true }, label: {
                        AccentColorButtonText(buttonText: "Sign In")
                    })

                    Button(action: { isSignUpFormViewActive = true }, label: {
                        AccentColorButtonText(buttonText: "Sign Up")
                    })
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SecondaryGreen"))
                        .scaleEffect(signInAnimationAmount)
                        .opacity(2 - signInAnimationAmount)
                        .animation(.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false), value: signInAnimationAmount)
                )
                .onAppear {
                    signInAnimationAmount = 2
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                        logoAnimation.toggle()
                    }
                }
                .sheet(isPresented: $isSignInFormViewActive) {
                    SignInFormView()
                }
                .sheet(isPresented: $isSignUpFormViewActive) {
                    SignUpFormView()
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
