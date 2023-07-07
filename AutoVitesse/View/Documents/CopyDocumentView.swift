//
//  CopyDocumentView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.06.23.
//

import SwiftUI

struct CopyDocumentView: View {
    var documentItems: [DocumentItem]
    @State var documentSelection = "e46-m3-owners-manual"
    @State var selectedNumbers: [Int] = []
    @State var isSelectAllChecked = false
    @State var pageCount = 170
    var body: some View {
        Form {
            Picker("Documents", selection: $documentSelection) {
                ForEach(documentItems, id: \.text) { option in
                    Text("\(option.text)")
                }
            }
            Text("Select which pages you want to copy.")
            Button(action: { selectAllPages() }, label: {
                HStack {
                    Text("Select All")
                    Image(systemName: isSelectAllChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 24, height: 24)
                }
            })
            .buttonStyle(PlainButtonStyle())
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity))
            ]) {
                ForEach(1...pageCount, id: \.self) { number in
                    CustomCheckBox(isChecked: selectedNumbers.contains(number),
                                   selectedNumbers: $selectedNumbers, number: number)
                }
            }
            if selectedNumbers != [] {
                HStack {
                    Spacer()
                    Button(action: { createCopy(fileName: documentSelection) }, label: {
                        AccentColorButtonText(buttonText: "Save Copy In Documents")
                    })
                    Spacer()
                }
            } else {
                Text("Please select at least one page!")
            }
        }
        .onChange(of: documentSelection) { _ in
            pageCount = getPDFPagesNum(fileName: documentSelection)
            selectedNumbers = []
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
