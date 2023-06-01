//
//  UserImagesListExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 26.05.23.
//

import Foundation
import UIKit

extension UserImagesList{
    
    
    func getImageFromName(fileName: String) -> UIImage{
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent(fileName)
        var image = UIImage()
        
        if let imageData = try? Data(contentsOf: url) {
            if let imageFromData = UIImage(data: imageData) {
                image = imageFromData
            } else {
                print("Couldn't get image data for \(fileName)")
            }
        } else {
            print("Couldn't get image data for \(fileName)")
        }
        return image
    }
    
}
