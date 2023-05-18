//
//  hashPassword.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation
import CryptoKit

class GlobalFuncs{
    
    func hashPassword(_ password : String) -> String {
        guard let data = password.data(using: .utf8) else { return "password" }
        let hashedData = SHA256.hash(data: data)
        let hashedString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashedString
    }
}
