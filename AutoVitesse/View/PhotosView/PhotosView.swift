//
//  PhotosView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 19.05.23.
//

import SwiftUI
import PhotosUI

struct PhotosView: View {
    @State private var image = UIImage()
    @State private var showLibrary = false
    @State private var showCamera = false
    var body: some View {
        ScrollView {
            VStack{
                Button(action: {showLibrary.toggle()}) {
                    Text("upload from device")
                        .font(.title2)
                        //.foregroundColor(.blue)
                }
                .sheet(isPresented: $showLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
                Button(action: {showCamera.toggle()}) {
                    Text("use camera")
                        .font(.title2)

                }
                .sheet(isPresented: $showCamera) {
                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
                .onChange(of: image) { newValue in
                    saveImage(image: image)
                }
                UserImagesList()
            }
        }
    }
}

//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
