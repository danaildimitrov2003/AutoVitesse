//
//  SideMenuButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct SideMenuButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .padding(.leading, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SideMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuButton()
    }
}
