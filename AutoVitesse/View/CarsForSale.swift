//
//  CarsForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct CarsForSale: View {
    @State var isFilterOpened = false
    @State var isSortOpened = false
    var body: some View {
        VStack{
            SearchBarCarsForSale()
            HStack{
                Button(action: {isFilterOpened.toggle()}) {
                    AccentColorButtonText(buttonText: "Filter")
                }
                Button(action: {isSortOpened.toggle()}) {
                    AccentColorButtonText(buttonText: "Sort")
                }
            }
            Button(action: {}) {
                AccentColorButtonText(buttonText: "Sell a car")
            }
            .sheet(isPresented: $isFilterOpened) {
                FilterView()
            }
            .sheet(isPresented: $isSortOpened) {
                SortView()
            }
           
        }
        
    }
}

struct CarsForSale_Previews: PreviewProvider {
    static var previews: some View {
        CarsForSale()
    }
}
