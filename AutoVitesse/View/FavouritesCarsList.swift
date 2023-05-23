//
//  CarsList.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import SwiftUI

struct FavouritesCarsList: View {
    let utils = Utils()
    @State var cars : [Car]
    @State var message : String
    var body: some View {
        if(cars.count >= 1){
            ForEach(cars) { car in
                CarComponent(carMake: car.make, carModel: car.model, carYear: car.year, userId: appSession.currentUser!.idString, carId: car.idString, isClicked: utils.isCarFavourited(carId: car.idString))
            }
        }else{
            Text(message)
                .font(.title2)
        }
    }
}

struct FavouritesCarsList_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesCarsList(cars: [Car()], message: "There are no records")
    }
}
