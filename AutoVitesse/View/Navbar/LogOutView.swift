//
//  LogOutView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct LogOutView: View {
    @Binding var selection: String
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Are you sure you want to log out?")
                .font(.title2)
                .foregroundColor(Color("TextColor"))
            HStack {
                Button(action: {
                    selection = "LogOut"
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    AccentColorButtonText(buttonText: "Yes")
                })

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    AccentColorButtonText(buttonText: "No")
                })
            }
        }
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView(selection: .constant(""))
    }
}
