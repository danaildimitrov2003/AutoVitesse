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
        DocumentItem(text: "2005_M5_Owners_Manual")]
    var body: some View {
        NavigationStack{
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                VStack{
                    ForEach(documentItems) { item in
                        NavigationLink(value: item){
                            Text(item.text)
                        }
                    }
                }
                .navigationDestination(for: DocumentItem.self){ item in
                    DocumentDetailView(fileName: item.text)
            }
            }
        }
        
    }
}

struct Documents_Previews: PreviewProvider {
    static var previews: some View {
        Documents()
    }
}
