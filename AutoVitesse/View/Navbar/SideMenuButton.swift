//
//  SideMenuButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct SideMenuButton: View {
    let toggleMenu: () -> Void
    @Binding var menuOpened: Bool
    var body: some View {
        Button(action: { toggleMenu() }, label: {
            Image(systemName: menuOpened ? "xmark" : "line.horizontal.3")
                .imageScale(.large)
                .frame(width: 24, height: 24)
                .foregroundColor(Color("WhiteTextColor"))
                .padding(.leading, 10)
                .animation(.easeIn, value: menuOpened)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct SideMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuButton(toggleMenu: {}, menuOpened: .constant(false))
    }
}
