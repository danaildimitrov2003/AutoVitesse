//
//  PhotosView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 19.05.23.
//

import SwiftUI

struct PhotosView: View {
    var body: some View {
        VStack{
            Text("There are no photos")
                .font(.title)
            Text("upload from device")
                .font(.title2)
                .foregroundColor(.blue)
            Text("use camera")
                .font(.title2)
                .foregroundColor(.blue)
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
