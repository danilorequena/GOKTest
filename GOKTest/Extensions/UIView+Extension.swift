//
//  UIView+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 02/09/20.
//

import UIKit

extension UIView {
    func shadowDefault() {
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
    }
}
