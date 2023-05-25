//
//  PhotosView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 19.05.23.
//

import SwiftUI
import PhotosUI

struct PhotosView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    var body: some View {
        VStack{
            Text("There are no photos")
                .font(.title)
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images){
                Text("upload from device")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .onChange(of: selectedItems){ newValue in
                guard let item = selectedItems.last else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result{
                    case.success(let data):
                        if let data = data{
                            self.data = data
                        }else{
                            print("Data is nil")
                        }
                    case.failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
            Text("use camera")
                .font(.title2)
                .foregroundColor(.blue)
            if let data = data, let uiImage = UIImage(data: data){
                Image(uiImage: uiImage)
                    .resizable()
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
