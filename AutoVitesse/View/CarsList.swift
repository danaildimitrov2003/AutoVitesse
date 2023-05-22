//
//  CarsList.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import SwiftUI

struct CarsList: View {
    @State var cars : [Car]
    var body: some View {
        if(cars.count >= 1){
            ForEach(cars) { car in
                CarComponent(carMake: car.make, carModel: car.model, carYear: car.year)
            }
        }else{
            Text("There are no records")
                .font(.title2)
        }
    }
}

struct CarsList_Previews: PreviewProvider {
    static var previews: some View {
        CarsList(cars: [Car()])
    }
}
