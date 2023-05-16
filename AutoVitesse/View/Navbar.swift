//
//  Navbar.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        HStack{
            LogOutButton()
                .padding(.trailing)
            Spacer()
            Text("AutoVitesse")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            SideMenuButton()
                .padding(.trailing)
        }
        .background(Color.mint)
        
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}
