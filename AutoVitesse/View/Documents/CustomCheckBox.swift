//
//  CustomCheckBox.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 4.07.23.
//

import SwiftUI

struct CustomCheckBox: View {
    var isChecked: Bool
    @Binding var selectedNumbers: [Int]
    var number : Int
    
    
    var body: some View {
        Button(action: {
            if selectedNumbers.contains(number) {
                selectedNumbers.removeAll { $0 == number }
            } else {
                selectedNumbers.append(number)
            }
            print(selectedNumbers)
        }) {
            HStack{
                Text(String(number))
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .foregroundColor(Color("AccentColor"))
                    .frame(width: 24, height: 24)
            }
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CustomCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CustomCheckBox(isChecked: false, selectedNumbers: .constant([]), number: 9)
    }
}
