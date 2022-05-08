//
//  ProductsCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class ProductsCollectionViewCell: UICollectionViewCell {
    private let view = UIView()
    private let productImage = UIImageView.Factory.build(
        contentMode: .scaleAspectFit,
        accessibilityIdentifier: "productImage"
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with product: Product) {
        productImage.download(from: product.imageURL, placeHolder: UIImage(named: ""))
    }
}

extension ProductsCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(view)
        view.addSubview(productImage)
    }
    
    func setupConstraints() {
        view.bindFrameToSuperviewBounds()
        productImage.anchorCenterTo(view: view)
        productImage.anchor(height: 80, width: 80)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 8
        contentView.dropShadow(
            offset: CGSize(width: 2, height: 3),
            radius: 4,
            opacity: 0.2,
            color: UIColor.lightGray.cgColor
        )
    }
}
