//
//  CarMessageComposeView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 20.06.23.
//

import SwiftUI

struct CarMessageComposeView: View {
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    let carForSale: CarForSale
    let utils = Utils()
    @State var messageCar = "Hi, is the car still available?"
    var body: some View {
        Form {
            HStack{
                Text("Message")
                .font(.title2)
                Text(utils.getUserByID(userID: carForSale.sellerId)?.username ?? "")
                    .font(.title2)
            }
            TextEditor(text: $messageCar)
            HStack{
                Spacer()
                Button(action: {sendMessage()}) {
                    AccentColorButtonText(buttonText: "Send Message")
                }
                Spacer()
            }
           
        }
        
    }
}

struct CarMessageComposeView_Previews: PreviewProvider {
    static var previews: some View {
        let carForSale = CarForSale()
        carForSale.make = "BMW"
        carForSale.model = "M5"
        carForSale.year = 2022
        carForSale.type = "Sedan"
        carForSale.carDescription = "This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan."
        carForSale.horsePower = 617
        carForSale.fuel = "Gasoline"
        carForSale.transmission = "Automatic"
        carForSale.mileage = 10000
        carForSale.price = 85000
        carForSale.sellerId = "6465e8bf881c671df018abdd"
        carForSale.photoId = "D94B19B6-E660-40B7-AF6C-73B4B31719CA"
        return CarMessageComposeView(carForSale: carForSale)
    }
}
