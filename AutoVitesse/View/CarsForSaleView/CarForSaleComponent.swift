//
//  CarForSaleComponent.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.06.23.
//

import SwiftUI

struct CarForSaleComponent: View {
    var image : UIImage
    var make : String
    var model : String
    var year : Int
    var price : Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("PrimaryGreen"))
                .frame(width: 300, height: 100)
                .offset(y: 140)
            VStack{
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(15)
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Rectangle())
                HStack{
                    Text(make)
                        .foregroundColor(Color("TextColor"))
                        .font(.title)
                    Text(model)
                        .foregroundColor(Color("TextColor"))
                        .font(.title)
                    Text(String(year))
                        .foregroundColor(Color("TextColor"))
                        .font(.title)
                }
                Text(String(price)+" $")
                    .foregroundColor(Color("TextColor"))
                    .font(.title)
                
            }
            
            
        }
        
    }
}

struct CarForSaleComponent_Previews: PreviewProvider {
    static var previews: some View {
        CarForSaleComponent(image: UIImage(named: "AppIcon")!, make: "BMW", model: "M3", year: 1977, price: 30000)
    }
}
