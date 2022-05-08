//
//  UIView+Shadow.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

extension UIView {
    public func dropShadow(
        offset: CGSize = CGSize(width: -2, height: 2),
        radius: CGFloat = 4,
        opacity: Float = 0.5,
        color: CGColor = UIColor.black.cgColor,
        scale: Bool = true
    ) {
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    public func clearDropShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.clear.cgColor
        layer.cornerRadius = 0.0
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.0
    }
}
