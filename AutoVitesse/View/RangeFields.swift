//
//  RangeFields.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI
import Combine

struct RangeFields: View {
    @State var title : String
    @State var min : String
    @State var max : String
    var body: some View {
        VStack{
            Text(title)
            HStack{
                TextField("Min", text: $min)
                    .keyboardType(.numberPad)
                    .onReceive(Just(min)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.min = filtered
                        }
                    }
                Text("to")
                TextField("Max", text: $max)
                    .keyboardType(.numberPad)
                    .onReceive(Just(max)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.max = filtered
                        }
                    }
            }
            .background(Color("SecondaryGreen"))
        }
    }
}

struct RangeFields_Previews: PreviewProvider {
    static var previews: some View {
        RangeFields(title: "Price", min: "1000", max: "100000")
    }
}
