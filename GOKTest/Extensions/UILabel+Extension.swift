//
//  UILabel+Extension.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

public enum UILabelImagePosition {
    case left, right
}

extension UILabel {
    public enum Factory {
        public static func build(
            text: String? = nil,
            textAlignment: NSTextAlignment = .left,
            textStyle: UIFont.TextStyle = .body,
            numberOfLines: Int = 1,
            accessibilityIdentifier: String,
            textColor: UIColor,
            adjustsFontSizeToFitWidth: Bool = false,
            minimumScaleFactor: CGFloat = 0
        ) -> UILabel {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = textAlignment

            label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
            label.minimumScaleFactor = minimumScaleFactor

            label.numberOfLines = numberOfLines
            label.adjustsFontForContentSizeCategory = true
            label.textColor = textColor
            label.accessibilityIdentifier = accessibilityIdentifier
            label.text = text
            return label
        }
    }

    public func addImage(
        _ image: UIImage,
        with color: UIColor,
        blankSpace: Bool = false,
        bounds: CGRect? = nil,
        on position: UILabelImagePosition,
        onAttributedText isAttributedText: Bool = false
    ) {
        let text = self.text?.trimmingCharacters(in: CharacterSet.alphanumerics.inverted) ?? ""

        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image.tint(with: color)

        if let bounds = bounds {
            imageAttachment.bounds = bounds
        }

        let imageString = NSMutableAttributedString(attachment: imageAttachment)

        if blankSpace {
            imageString.append(NSMutableAttributedString(string: "  "))
        }

        let fullString: NSMutableAttributedString
        if isAttributedText, let attributedText = attributedText {
            fullString = NSMutableAttributedString(attributedString: attributedText)
        } else {
            fullString = NSMutableAttributedString(string: text)
        }

        if position == .left {
            fullString.insert(imageString, at: 0)
        } else {
            fullString.append(imageString)
        }

        attributedText = fullString
    }

    public func applyColor(at range: NSRange, color: UIColor) {
        guard let string = text else { return }
        let colorAttributes = [NSAttributedString.Key.foregroundColor: color]
        let attrStr = NSMutableAttributedString(string: string, attributes: [:])
        attrStr.setAttributes(colorAttributes, range: range)
        attributedText = attrStr
    }

    public func applyColor(allOccurrencesOf string: String, color: UIColor) {
        guard let text = text else { return }

        let attrStr = NSMutableAttributedString(string: text)

        var copyText = text
        copyText.forEach { _ in
            guard
                copyText.contains(string),
                let range = copyText.range(of: string)
            else { return }
            let coloredNSRange = NSRange(range, in: text)
            attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: coloredNSRange)
            copyText.replaceSubrange(range, with: " ")
        }

        attributedText = attrStr
        sizeToFit()
    }

    public func applyColor(at string: String, color: UIColor) {
        guard
            let text = text,
            let coloredRange = text.range(of: string)
        else { return }

        let coloredNSRange = NSRange(coloredRange, in: text)
        applyColor(at: coloredNSRange, color: color)
    }
    
    public func applyBoldFont(at string: String) {
        guard
            let text = text,
            let boldRange = text.range(of: string)
        else { return }

        let boldNSRange = NSRange(boldRange, in: text)
        applyBoldFont(at: boldNSRange)
    }
    
    public func applyBoldFont(at range: NSRange) {
        guard let string = text else { return }
        let boldFont: UIFont = .boldSystemFont(ofSize: 22)
        let boldAttribute = [NSAttributedString.Key.font: boldFont]
        let attrStr = NSMutableAttributedString(string: string, attributes: [:])
        attrStr.setAttributes(boldAttribute, range: range)
        attributedText = attrStr
    }
}
