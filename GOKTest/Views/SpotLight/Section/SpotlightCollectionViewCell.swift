//
//  SpotlightCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class SpotlightCollectionViewCell: UICollectionViewCell {
    private let image = UIImageView.Factory.build(
        contentMode: .scaleAspectFit,
        accessibilityIdentifier: "image"
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpotlightCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(image)
    }
    
    func setupConstraints() {
        image.bindFrameToSuperviewBounds()
    }
}
