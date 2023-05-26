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
            image = UIImage(data: imageData)!
            
        } else {
            print("Couldn't get image for \(fileName)")
        }
        return image
    }
    
}
