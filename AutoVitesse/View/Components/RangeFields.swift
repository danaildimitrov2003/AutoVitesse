//
//  RangeFields.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct RangeFields: View {
    @State var title : String
    @Binding var min : String
    @Binding var max : String
    var body: some View {
        VStack{
            Text(title)
            HStack{
                NumericTextField(title: "Min", value: $min)
                Text("to")
                NumericTextField(title: "Max", value: $max)
            }
        }
    }
}

struct RangeFields_Previews: PreviewProvider {
    static var previews: some View {
        RangeFields(title: "Price", min: .constant("1000"), max: .constant("100000"))
    }
}
