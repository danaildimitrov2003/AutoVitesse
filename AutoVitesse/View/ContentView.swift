//
//  ContentView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to AutoVitesse!")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Image(systemName: "car")
                .imageScale(.large)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            Text("Sigh up")
                .font(.title2)
            .foregroundColor(.accentColor)
            Text("Sigh in")
                .font(.title2)
            .foregroundColor(.accentColor)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
