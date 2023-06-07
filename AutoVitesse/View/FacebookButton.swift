//
//  facebookButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 7.06.23.
//

import SwiftUI
import FBSDKLoginKit

struct FacebookButton: View {
    @State var manager = LoginManager()
    var buttonText : String
    @Binding var showHomeView : Bool
    @Binding var showFacebookSignUp : Bool
    var body: some View {
        Button(action: facebookSignIn) {
            Text(buttonText)
                .foregroundColor(Color("AccentColor"))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//struct FacebookButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FacebookButton(buttonText: "sign in with Facebook")
//    }
//}
