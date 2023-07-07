//
//  EmailTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    @State var emailState: String
    @Binding var errorMessage: String
    @Binding var isEmailCompleted: Bool
    var body: some View {
        TextField("Email", text: $emailState)
            .disableAutocorrectAndAutocapitalize()
            .foregroundColor(Color("TextColor"))
            .onChange(of: emailState) { _ in
                email = emailState
                handleEmailChange(email)
            }
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(email: .constant("email"), emailState: "email",
                       errorMessage: .constant("error message"), isEmailCompleted: .constant(true))
    }
}
