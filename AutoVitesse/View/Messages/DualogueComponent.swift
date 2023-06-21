//
//  DualogueComponent.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import SwiftUI

struct DualogueComponent: View {
    var lastMessage : String
    var senderId : String
    var carId : String
    let utils = Utils()
    
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Text(utils.getUserByID(userID: senderId)?.username ?? "Username")
                        .foregroundColor(Color("BlackTextColor"))
                    Text("About")
                        .foregroundColor(Color("BlackTextColor"))
                    Text(utils.getCarForSaleByID(carForSaleID: carId)?.make ?? "Make")
                        .foregroundColor(Color("BlackTextColor"))
                    Text(utils.getCarForSaleByID(carForSaleID: carId)?.model ?? "Model")
                        .foregroundColor(Color("BlackTextColor"))
                    Spacer()
                }
                .background(Color("SecondaryGreen"))
                .cornerRadius(15)
                Text(lastMessage)
                    .foregroundColor(Color("BlackTextColor"))
                    .font(.title2)
            }
            Spacer()
        }
        .padding()
        .background(Color("PrimaryGreen"))
        .cornerRadius(15)
        
    }
}

struct DualogueComponent_Previews: PreviewProvider {
    static var previews: some View {
        DualogueComponent(lastMessage: "Hello, message, Hello, message,Hello, message, Hello, message", senderId: "12345", carId: "12345")
    }
}
