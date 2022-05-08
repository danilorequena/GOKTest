//
//  ProductsCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class ProductsCollectionViewCell: UICollectionViewCell {
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
        addSubview(productImage)
    }
    
    func setupConstraints() {
        productImage.bindFrameToSuperviewBounds()
    }
}
