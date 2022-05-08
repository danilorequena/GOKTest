//
//  SpotlightCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit
import Kingfisher

final class SpotlightCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView.Factory.build(
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
    
    func setupCell(url: String) {
        imageView.download(from: url, placeHolder: UIImage(named: ""))
    }
}

extension SpotlightCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.bindFrameToSuperviewBounds()
    }
}
