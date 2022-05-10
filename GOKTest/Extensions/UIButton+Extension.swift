//
//  UIButton+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 09/05/22.
//

import UIKit

extension UIButton {
    public enum Factory {
        public static func build(
            title: String? = nil,
            titleColor: UIColor = .black,
            contentHorizontalAlignment: UIControl.ContentHorizontalAlignment = .center,
            image: UIImage? = nil,
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0,
            borderColor: CGColor = UIColor.clear.cgColor,
            borderWidth: CGFloat = 0.0,
            textStyle: UIFont.TextStyle = .headline,
            accessibilityIdentifier: String
        ) -> UIButton {
            let button = UIButton(frame: .zero)
            button.setTitle(title, for: .normal)
            button.setTitleColor(titleColor, for: .normal)
            button.setImage(image, for: .normal)
            button.backgroundColor = backgroundColor
            button.layer.cornerRadius = cornerRadius
            button.tintColor = titleColor
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.accessibilityIdentifier = accessibilityIdentifier
            button.contentHorizontalAlignment = contentHorizontalAlignment
            button.layer.borderColor = borderColor
            button.layer.borderWidth = borderWidth

            return button
        }
    }
}
