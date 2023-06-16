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
    @State var minSelection: Int
    @State var maxSelection: Int
    
    init(title: String, min: Int, max: Int, minBinding: Binding<Int>, maxBinding: Binding<Int>) {
        self.title = title
        self.min = min
        self.max = max
        self._minBinding = minBinding
        self._maxBinding = maxBinding
        self._minSelection = State(initialValue: min)
        self._maxSelection = State(initialValue: max)
    }
    
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
                    ForEach(utils.generateArray(min: minBinding, max: maxBinding), id: \.self) { option in
                        Text(String(option))
                    }
                }
            }
            .background(Color("SecondaryGreen"))
        }
    }
}

struct RangePicker_Previews: PreviewProvider {
    static var previews: some View {
        RangePicker(title: "Picker", min: 1984, max: 2024, minBinding: .constant(1984), maxBinding: .constant(2024))
    }
}
