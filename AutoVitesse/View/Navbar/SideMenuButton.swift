//
//  SideMenuButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct SideMenuButton: View {
    let toggleMenu: () -> Void
    @State var isClicked = false
    var body: some View {
        Button(action: {toggleMenu(); isClicked.toggle()}) {
            Image(systemName: isClicked ? "xmark" : "line.horizontal.3")
                .imageScale(.large)
                .frame(width: 24, height: 24)
                .foregroundColor(Color("WhiteTextColor"))
                .padding(.leading, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//struct SideMenuButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuButton(menuOpened: )
//    }
//}
