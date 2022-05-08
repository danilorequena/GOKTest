//
//  SpotlightCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit
import Kingfisher

final class SpotlightCollectionViewCell: UICollectionViewCell {
    private let view = UIView()
    private let imageView = UIImageView.Factory.build(
        contentMode: .scaleAspectFill,
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
        imageView.download(from: url, placeHolder: UIImage(named: "noImage"))
    }
}

extension SpotlightCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(view)
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        view.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            insets: .init(top: 2, left: 2, bottom: 2, right: 2)
        )
        
        imageView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.dropShadow(
            offset: CGSize(width: 2, height: 3),
            radius: 4,
            opacity: 0.2,
            color: UIColor.lightGray.cgColor
        )
    }
}
