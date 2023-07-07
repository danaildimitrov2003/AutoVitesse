//
//  Navbar.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct Navbar: View {
    let toggleMenu: () -> Void
    @Binding var menuOpened: Bool
    var body: some View {
        HStack {
            LogOutButton()
                .padding(.trailing)
            Spacer()
            Text("AutoVitesse")
                .font(.title)
                .foregroundColor(Color("WhiteTextColor"))
            Spacer()
            SideMenuButton(toggleMenu: toggleMenu, menuOpened: $menuOpened)
                .padding(.trailing)
        }
        .background(Color("SecondaryGreen"))
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar(toggleMenu: {}, menuOpened: .constant(false))
    }
}
