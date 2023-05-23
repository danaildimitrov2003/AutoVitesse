//
//  CarComponent.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import SwiftUI

struct CarComponent: View {
    let carMake : String
    let carModel : String
    let carYear : Int
    let userId : String
    let carId : String
    @State var isClicked : Bool
    
    var body: some View {
        HStack{
            Text(carMake)
            Text(carModel)
            Text(String(carYear))
            Image(systemName: isClicked ? "star.fill" : "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width:20, height: 20, alignment: .center)
                .onTapGesture {
                    if(isClicked == false){
                        handleFavouriteClick(userId: userId, carId: carId)
                    }else{
                        handleUnFavouriteClick(userId: userId, carId: carId)
                    }
                    isClicked.toggle()   
                }
        }
    }
}

struct CarComponent_Previews: PreviewProvider {
    static var previews: some View {
        CarComponent(carMake: "Porsche", carModel: "911", carYear: 2003, userId: "101", carId: "102", isClicked: false)
    }
}
