//
//  NumericTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 13.06.23.
//

import SwiftUI
import Combine

struct NumericTextField: View {
    var title: String
    @Binding var value: String
    var body: some View {
        TextField(title, text: $value)
            .keyboardType(.numberPad)
            .onReceive(Just(value)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.value = filtered
                }
            }
    }
}

struct NumericTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumericTextField(title: "Title", value: .constant(""))
    }
}
