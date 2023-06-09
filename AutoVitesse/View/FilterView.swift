//
//  FilterView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct FilterView: View {
    @State var make = ""
    var body: some View {
        List{
            VStack{
                Text("Filter")
                    .font(.title)
                TextField("Make", text: $make)
                RangePicker(title: "Year", min: 1984, max: 2024)
                RangeFields(title: "Price", min: "1000", max: "100000")
            }
        }
       
        
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
