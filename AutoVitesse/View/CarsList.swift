//
//  CarsList.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import SwiftUI
import RealmSwift

struct CarsList: View {
    let utils = Utils()
    @ObservedResults(
        Car.self
    ) var allCars
    @State var cars : [Car]
    @State var message : String
    var body: some View {
        
        if(cars != []){
            if(cars[0].year != 0){
                if(cars.count >= 1){
                    ForEach(cars) { car in
                        CarComponent(carMake: car.make, carModel: car.model, carYear: car.year, userId: utils.getCurrentUser().idString, carId: car.idString, isClicked: utils.isCarFavourited(carId: car.idString), carsList: $cars)
                    }
                }else{
                    Text(message)
                        .font(.title2)
                        .foregroundColor(Color("TextColor"))
                }
            }else{
                if(allCars.count >= 1){
                    ForEach(allCars) { car in
                        CarComponent(carMake: car.make, carModel: car.model, carYear: car.year, userId: utils.getCurrentUser().idString, carId: car.idString, isClicked: utils.isCarFavourited(carId: car.idString), carsList: $cars)
                    }
                }else{
                    Text(message)
                        .font(.title2)
                        .foregroundColor(Color("TextColor"))
                }
            }
        }else{
            Text(message)
                .font(.title2)
                .foregroundColor(Color("TextColor"))
        }
        
        
        
        
        
    }
}

//struct CarsList_Previews: PreviewProvider {
//    static var previews: some View {
//        CarsList(cars: [Car()], message: "There are no records")
//    }
//}
