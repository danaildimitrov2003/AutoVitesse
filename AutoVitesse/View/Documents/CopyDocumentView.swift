//
//  CopyDocumentView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.06.23.
//

import SwiftUI

struct CopyDocumentView: View {
    var documentItems : [DocumentItem]
    @State var documentSelection = "e46-m3-owners-manual"
    @State var numberSelection = ""
    var body: some View {
        Form{
            Picker("Documents", selection: $documentSelection) {
                ForEach(documentItems, id: \.text) { option in
                    Text("\(option.text)")
                }
            }
            VStack(alignment: .leading) {
                NumericTextField(title: "Number of pages", value: $numberSelection)
                Text("Leave blank if you want all")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Spacer()
                Button(action: {createCopy(fileName: documentSelection, numOfPages: numberSelection)}) {
                    AccentColorButtonText(buttonText: "Save Copy In Documents")
                }
                Spacer()
            }
        }
    }
}

struct CopyDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        CopyDocumentView(documentItems: [
            DocumentItem(text: "e46-m3-owners-manual"),
            DocumentItem(text: "Porsche-959-Driver-Manual"),
            DocumentItem(text: "2005_M5_Owners_Manual"),
            DocumentItem(text: "Porsche-Carrera-GT-Owners-Manual")
            ])
    }
}
