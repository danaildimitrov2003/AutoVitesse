//
//  UserImageView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 26.05.23.
//

import SwiftUI

struct UserImageComponent: View {
    var image: UIImage
    var body: some View {
        Image(uiImage: self.image)
            .resizable()
            .cornerRadius(4)
            .frame(width: 300, height: 300)
            .background(Color.black.opacity(0.2))
            .aspectRatio(contentMode: .fill)
            .clipShape(Rectangle())
    }
}

// struct UserImageComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImageComponent(image: <#UIImage#>)
//    }
// }
