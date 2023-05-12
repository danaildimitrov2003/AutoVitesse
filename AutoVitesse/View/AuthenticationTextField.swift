//
//  AuthenticationTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import SwiftUI

struct AuthenticationTextField: View {
    
    var text : String
    
    @State var binding : String
    
    
    var body: some View {
        TextField(text, text: $binding)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

struct AuthenticationTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationTextField(text: "Test", binding: "test")
    }
}

