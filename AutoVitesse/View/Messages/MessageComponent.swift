//
//  MessageComponent.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import SwiftUI

struct MessageComponent: View {
    let message : String
    let senderId : String
    let utils = Utils()
    
    var body: some View {
        HStack {
            if(senderId == utils.getCurrentUser().idString){
                Spacer()
            }
            VStack(alignment: senderId == utils.getCurrentUser().idString ? .trailing : .leading){
                HStack{
                    Text(utils.getUserByID(userID: senderId)?.username ?? "Username")
                        .foregroundColor(Color("BlackTextColor"))
                }
                .background(Color("SecondaryGreen"))
                .cornerRadius(15)
                Text(message)
                    .foregroundColor(Color("BlackTextColor"))
                    .font(.title2)
            }
            .padding()
            .background(Color("PrimaryGreen"))
            .cornerRadius(15)
            if(senderId != utils.getCurrentUser().idString){
                Spacer()
            }
        }
    }
}

struct MessageComponent_Previews: PreviewProvider {
    static var previews: some View {
        MessageComponent(message: "no", senderId: "12345")
    }
}
