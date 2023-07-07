//
//  AccentColorButtonText.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct AccentColorButtonText: View {
    let buttonText: String
    var body: some View {
        Text(buttonText)
            .padding()
            .background(Color("AccentColor"))
            .foregroundColor(Color("WhiteTextColor"))
            .cornerRadius(10)
    }
}

struct AccentColorButtonText_Previews: PreviewProvider {
    static var previews: some View {
        AccentColorButtonText(buttonText: "Button")
    }
}
