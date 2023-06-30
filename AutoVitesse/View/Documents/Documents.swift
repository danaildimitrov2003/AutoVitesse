//
//  Documents.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 23.06.23.
//

import SwiftUI

struct DocumentItem: Identifiable, Hashable{
    var id =  UUID()
    let text: String
}

struct Documents: View {
    let documentItems : [DocumentItem] = [
        DocumentItem(text: "e46-m3-owners-manual"),
        DocumentItem(text: "Porsche-959-Driver-Manual"),
        DocumentItem(text: "2005_M5_Owners_Manual"),
        DocumentItem(text: "Porsche-Carrera-GT-Owners-Manual")
    ]
    @State var isCopyDocumentOpen = false
    var body: some View {
        NavigationStack{
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                ScrollView{
                    Button(action: { isCopyDocumentOpen.toggle() }) {
                        AccentColorButtonText(buttonText: "Copy Document")
                    }
                    Text("Owner's Manuals")
                        .font(.title)
                        .foregroundColor(Color("TextColor"))
                    ForEach(documentItems) { item in
                        NavigationLink(value: item){
                            AccentColorButtonText(buttonText: item.text)
                        }
                    }
                }
                .navigationDestination(for: DocumentItem.self){ item in
                    DocumentDetailView(fileName: item.text)
                }
            }
            .sheet(isPresented: $isCopyDocumentOpen) {
                CopyDocumentView(documentItems: documentItems)
            }
        }
        
    }
}

struct Documents_Previews: PreviewProvider {
    static var previews: some View {
        Documents()
    }
}
