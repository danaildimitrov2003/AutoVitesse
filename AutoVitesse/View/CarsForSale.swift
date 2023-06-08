//
//  CarsForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct CarsForSale: View {
    @State var isFilterOpenned = false
    var body: some View {
        VStack{
            SearchBarTextField()
            HStack{
                Button(action: {isFilterOpenned.toggle()}) {
                    Text("Filter")
                        .padding()
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("WhiteTextColor"))
                        .cornerRadius(10)
                }
                Button(action: {}) {
                    Text("Sort")
                        .padding()
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("WhiteTextColor"))
                        .cornerRadius(10)
                }
            }
            Button(action: {}) {
                Text("Sell a car")
                    .padding()
                    .background(Color("AccentColor"))
                    .foregroundColor(Color("WhiteTextColor"))
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isFilterOpenned) {
                FilterView()
            }
        }
        
    }
}

struct CarsForSale_Previews: PreviewProvider {
    static var previews: some View {
        CarsForSale()
    }
}
