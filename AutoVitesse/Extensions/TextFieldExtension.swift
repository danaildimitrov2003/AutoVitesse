//
//  TextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 15.05.23.
//

import Foundation
import SwiftUI

extension TextField {
    func disableAutocorrectAndAutocapitalize() -> some View {
        self
            .autocapitalization(.none)
            .disableAutocorrection(true)
    }
}
