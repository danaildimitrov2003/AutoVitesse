//
//  NewMessageTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import SwiftUI

struct NewMessageTextField: View {
    let sendMessage: (String) -> Void
    @State var newMessage = ""
    var body: some View {
        HStack {
            TextField("Message", text: $newMessage)
                .disableAutocorrectAndAutocapitalize()
                .font(.title)
                .frame(width: UIScreen.main.bounds.width*0.75)
                .onSubmit {
                    saveMessage()
                }
            Button(action: {saveMessage()}) {
                Image(systemName:"arrowshape.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("SecondaryGreen"))
                    .frame(width:32, height: 32, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.8)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("SecondaryGreen"), lineWidth: 3)
        )
        
        
    }
}

struct NewMessageTextField_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageTextField(sendMessage: {_ in print("Message Sent!")})
    }
}
