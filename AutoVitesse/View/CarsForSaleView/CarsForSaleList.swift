//
//  CarsForSaleList.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.06.23.
//

import SwiftUI
import RealmSwift

struct CarsForSaleList: View {
    var utils = Utils()
    @ObservedResults(
    CarForSale.self
    ) var carsForSale
    
    var body: some View {
        if(carsForSale.count >= 1){
            ForEach(carsForSale.reversed()) { car in
                CarForSaleComponent(image: utils.getImageFromName(fileName: car.photoId), make: car.make, model: car.model, year: car.year, price: car.price)
            }
        }else{
            Text("There are currently no cars for sale")
                .font(.title)
                .foregroundColor(Color("TextColor"))
        }
    }
}

struct CarsForSaleList_Previews: PreviewProvider {
    static var previews: some View {
        CarsForSaleList()
    }
}
