//
//  UIImage+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit
import CoreGraphics

extension UIImage {
    public func tint(with fillColor: UIColor) -> UIImage {
        let image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        fillColor.set()
        image.draw(in: CGRect(origin: .zero, size: size))

        guard let imageColored = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }

        UIGraphicsEndImageContext()
        return imageColored
    }

    public static func drawFromPDFData(data: Data, pageNumber: Int = 1) -> UIImage? {
        guard
            let provider = CGDataProvider(data: data as CFData),
            let document = CGPDFDocument(provider),
            let page = document.page(at: pageNumber)
        else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let image = renderer.image { context in
            UIColor.white.setFill()
            context.fill(pageRect)
            context.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            context.cgContext.scaleBy(x: 1.0, y: -1.0)
            context.cgContext.drawPDFPage(page)
        }
        return image
    }

    public func resized(to targetSize: CGSize) -> UIImage {
        let widthRatio  = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(
                width: size.width * heightRatio,
                height: size.height * heightRatio
            )
        } else {
            newSize = CGSize(
                width: size.width * widthRatio,
                height: size.height * widthRatio
            )
        }

        let targetRect = CGRect(
            x: .zero,
            y: .zero,
            width: newSize.width,
            height: newSize.height
        )

        return UIGraphicsImageRenderer(size: targetSize).image { _ in
            draw(in: targetRect)
        }
    }

    public enum ImageFilter: String {
        case noir = "CIPhotoEffectNoir"
        case mono = "CIPhotoEffectMono"
    }

    public func withFilter(filterName: ImageFilter) -> UIImage? {
        let context = CIContext(options: nil)
        guard let filter = CIFilter(name: filterName.rawValue) else { return nil }
        filter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let filteredImage = filter.outputImage,
           let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}
