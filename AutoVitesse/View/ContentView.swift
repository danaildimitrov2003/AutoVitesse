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
    
    init(){
        let realm = try! Realm()
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    var body: some View {
        VStack {
            Text("Welcome to AutoVitesse!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Image(systemName: "car")
                .imageScale(.large)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            Button(action: {
                isSignInFormViewActive = true
            }) {
                Text("Sign Ip")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isSignInFormViewActive) {
                SignInFormView(user: User())
            }
            Button(action: {
                isSignUpFormViewActive = true
            }) {
                Text("Sign Up")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isSignUpFormViewActive) {
                SignUpFormView(user: User())
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
