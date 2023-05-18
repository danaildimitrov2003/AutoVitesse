//
//  PasswordTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password : String
    @State var passwordState = ""
    @Binding var errorMessage : String
    @Binding var isPasswordCompleted : Bool
    
    var body: some View {
        SecureField("Password", text: $passwordState)
            .onChange(of: passwordState){ newValue in
                password = passwordState
                handlePasswordChange(password)
            }
    }
}

//struct PasswordTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordTextField(password: "password")
//    }
//}
