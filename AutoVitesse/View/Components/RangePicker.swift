//
//  RangePicker.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct RangePicker: View {
    var title : String
    var utils = Utils()
    @Binding var minBinding: Int
    @Binding var maxBinding: Int
    @State var min: Int
    @State var max: Int
    
    var body: some View {
        VStack{
            Text(title)
            HStack{
                Picker(selection: $minBinding, label: Text("")) {
                    ForEach(utils.generateArray(min: min, max: max), id: \.self) { option in
                        Text(String(option))
                    }
                }
                Text("to")
                Picker(selection: $maxBinding, label: Text("")) {
                    ForEach(utils.generateArray(min: min, max: max), id: \.self) { option in
                        Text(String(option))
                    }
                }
            }
        }
    }
}

struct RangePicker_Previews: PreviewProvider {
    static var previews: some View {
        RangePicker(title: "Picker", minBinding: .constant(1084), maxBinding: .constant(2024), min: 1984, max: 2024)
    }
}
