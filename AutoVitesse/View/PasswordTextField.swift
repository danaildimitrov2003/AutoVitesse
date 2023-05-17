//
//  PasswordTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password : String
    var body: some View {
        SecureField("Password", text: $password)
            .onChange(of: password){ newValue in
                //handlePasswordChange(password)
                print($password)
            }
    }
}

//struct PasswordTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordTextField(password: "password")
//    }
//}
