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
    ) var sellingMessages
    @ObservedResults(
        Dialogue.self,
      where: { $0.buyerId == appSession.currentUser?.idString ?? ""}
    ) var buyingMessages
    var body: some View {
        if(sellingMessages.count >= 1){
            ForEach(sellingMessages) { message in
                Text(message.messages.last?.message ?? "")
            }
        }else{
            Text("No messages received about your cars for sale.")
                .font(.title)
                .foregroundColor(Color("TextColor"))
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
