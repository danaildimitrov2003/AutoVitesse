//
//  MessagesView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 20.06.23.
//

import SwiftUI
import RealmSwift

struct MessagesView: View {
    @ObservedResults(
        Dialogue.self,
        where: { $0.sellerId == appSession.currentUser?.idString ?? ""}
    ) var sellingDialogues
    @ObservedResults(
        Dialogue.self,
        where: { $0.buyerId == appSession.currentUser?.idString ?? ""}
    ) var buyingDialogues
    let utils = Utils()
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                VStack{
                    ScrollView{
                        Text("Messages as a Seller:")
                            .font(.title2)
                            .foregroundColor(Color("TextColor"))
                        if(sellingDialogues.count >= 1){
                            ForEach(sellingDialogues.reversed()) { dialogue in
                                NavigationLink(value: dialogue){
                                    DualogueComponent(lastMessage: dialogue.messages.last?.message ?? "", senderId: dialogue.buyerId, carId: dialogue.carForSaleId)
                                        .padding(.horizontal)
                                }
                            }
                        }else{
                            Text("No messages received about your cars for sale.")
                                .font(.title)
                                .foregroundColor(Color("TextColor"))
                        }
                        Text("Messages as a Buyer:")
                            .font(.title2)
                            .foregroundColor(Color("TextColor"))
                        if(buyingDialogues.count >= 1){
                            ForEach(buyingDialogues.reversed()) { dialogue in
                                NavigationLink(value: dialogue){
                                    DualogueComponent(lastMessage: dialogue.messages.last?.message ?? "", senderId: dialogue.sellerId, carId: dialogue.carForSaleId)
                                        .padding(.horizontal)
                                }
                            }
                        }else{
                            Text("No messages about cars for sale.")
                                .font(.title)
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                    .navigationDestination(for: Dialogue.self){ dialogue in
                        DialogueDetailView(dialogue: dialogue, messages: Array(dialogue.messages), car: utils.getCarForSaleByID(carForSaleID: dialogue.carForSaleId) ?? CarForSale())
                    }
                }
            }
        }
    }
}

//struct MessagesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagesView()
//    }
//}
