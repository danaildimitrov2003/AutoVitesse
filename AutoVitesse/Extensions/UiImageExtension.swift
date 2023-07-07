//
//  UIImageExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 31.05.23.
//

import Foundation
import UIKit

extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }
        var transform = CGAffineTransform.identity
        transform = applyOrientationTransform(transform)
        guard let cgImage = self.cgImage,
              let colorSpace = cgImage.colorSpace,
              let context = createContext(cgImage: cgImage, colorSpace: colorSpace, transform: transform) else {
            return self
        }
        let newCGImage = context.makeImage()
        return UIImage(cgImage: newCGImage ?? cgImage)
    }

    private func applyOrientationTransform(_ transform: CGAffineTransform) -> CGAffineTransform {
        var transform = transform
        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -.pi / 2)
        default:
            break
        }
        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        return transform
    }

    private func createContext(cgImage: CGImage, colorSpace: CGColorSpace, transform: CGAffineTransform) -> CGContext? {
        return CGContext(data: nil,
                         width: Int(self.size.width),
                         height: Int(self.size.height),
                         bitsPerComponent: cgImage.bitsPerComponent,
                         bytesPerRow: 0,
                         space: colorSpace,
                         bitmapInfo: cgImage.bitmapInfo.rawValue)
    }

}
