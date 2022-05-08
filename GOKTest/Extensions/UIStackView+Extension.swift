//
//  UIStackView+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
