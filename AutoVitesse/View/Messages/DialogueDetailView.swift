//
//  DialogueDetailView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import SwiftUI

struct DialogueDetailView: View {
    @State var newMessage = ""
    @State var showCarDetailView = false
    @State var dialogue: Dialogue
    @State var messages: [Message]
    var car: CarForSale
    let utils = Utils()
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        CarForSaleComponent(image: utils.getImageFromName(fileName: car.photoId),
                                            make: car.make, model: car.model, year: car.year, price: car.price)
                            .onTapGesture {
                                showCarDetailView.toggle()
                            }
                        ForEach(messages) { message in
                            MessageComponent(message: message.message, senderId: message.senderId)
                                .id(message.idString)
                                .padding(.horizontal)
                        }
                    }
                    .onAppear {
                        proxy.scrollTo(messages.last?.idString)
                    }
                    .onChange(of: messages.count) { _ in
                        withAnimation(.easeIn) {
                            proxy.scrollTo(messages.last?.idString)
                        }
                    }
                    NewMessageTextField(sendMessage: sendMessage)
                }
            }
            .sheet(isPresented: $showCarDetailView) {
                CarDetailView(carForSale: car, showMessageButton: false)
            }
        }
    }
}

struct DialogueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueDetailView(dialogue: Dialogue(), messages: [Message()], car: CarForSale())
    }
}
