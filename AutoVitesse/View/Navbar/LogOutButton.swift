//
//  LogOutButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct LogOutButton: View {
    @State var showLandingView = false
    var body: some View {
        Button(action: logOut) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .padding(.leading, 10)
        }
        .buttonStyle(PlainButtonStyle())
        .fullScreenCover(isPresented: $showLandingView) {
            ContentView()
        }
    }
}

struct LogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButton()
    }
}
