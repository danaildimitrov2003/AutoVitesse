//
//  UsernameTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import SwiftUI

struct UsernameTextField: View {
    @Binding var username : String
    @State var usernameState : String
    @Binding var errorMessage : String
    @Binding var isUsernameCompleted : Bool
    
    var body: some View {
        TextField("Username", text: $usernameState)
            .disableAutocorrectAndAutocapitalize()
            .onChange(of: usernameState) { newValue in
                username = usernameState
                handleUsernameChange(username)
            }
    }
}

//struct UsernameTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        UsernameTextField()
//    }
//}
