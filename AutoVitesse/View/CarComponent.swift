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
    @State var isClicked = false
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
                    isClicked.toggle()
                }
        }
    }
}

struct CarComponent_Previews: PreviewProvider {
    static var previews: some View {
        CarComponent(carMake: "Porsche", carModel: "911", carYear: 2003)
    }
}
