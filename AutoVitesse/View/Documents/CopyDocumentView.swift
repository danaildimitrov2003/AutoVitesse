//
//  CopyDocumentView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.06.23.
//

import SwiftUI
import CheckBoxPackage

struct CopyDocumentView: View {
    var documentItems: [DocumentItem]
    @State var documentSelection = "e46-m3-owners-manual"
    @State var selectedNumbers: [Int] = []
    @State var isSelectAllChecked = false
    @State var pageCount = 170
    @State var message = ""
    var body: some View {
        Form {
            Picker("Documents", selection: $documentSelection) {
                ForEach(documentItems, id: \.text) { option in
                    Text("\(option.text)")
                }
            }
            Text("Select which pages you want to copy.")
            CustomCheckBoxWithAction(isChecked: isSelectAllChecked, text: "Select All", action: selectAllPages)
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity)),
                GridItem(.flexible(minimum: 0, maximum: .infinity))
            ]) {
                ForEach(1...pageCount, id: \.self) { number in
                    CustomCheckBoxWithAction(isChecked: selectedNumbers.contains(number), text: "\(number)",
                                             action: {selectPage(number: number)})
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
            Text(message)
                .font(.title3)
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
