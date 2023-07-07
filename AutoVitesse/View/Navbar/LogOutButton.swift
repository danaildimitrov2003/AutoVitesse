//
//  LogOutButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct LogOutButton: View {
    @State var showLogOutView = false
    @State var selection: String? = ""
    @State var selectionBinding = ""
    var body: some View {
        ZStack {
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true),
                           tag: "LogOut", selection: $selection) {}
                .onChange(of: selectionBinding) { _ in
                    selection = selectionBinding
                }
            Button(action: logOut) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("WhiteTextColor"))
                    .padding(.leading, 10)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .sheet(isPresented: $showLogOutView) {
            LogOutView(selection: $selectionBinding)
        }
    }
}

struct LogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButton()
    }
}
