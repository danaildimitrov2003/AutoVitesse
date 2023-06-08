//
//  ConfirmPasswordTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import SwiftUI

struct ConfirmPasswordTextField: View {
    @Binding var password : String
    @Binding var confirmPassword : String
    @State var confirmPasswordState = ""
    @Binding var errorMessage : String
    @Binding var isConfirmPasswordCompleted : Bool
    
    var body: some View {
        SecureField("Confirm Password", text: $confirmPasswordState)
            .foregroundColor(Color("TextColor"))
            .onChange(of: confirmPasswordState){ newValue in
                confirmPassword = confirmPasswordState
                handleConfirmPasswordChange(password, confirmPassword)
            }
    }
}

struct ConfirmPasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPasswordTextField(password: .constant("password"), confirmPassword: .constant("password"), errorMessage: .constant("error message"), isConfirmPasswordCompleted: .constant(true))
    }
}
