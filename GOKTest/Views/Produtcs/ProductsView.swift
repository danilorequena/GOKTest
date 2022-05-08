//
//  ProductsView.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class ProductsView: UIView {
    private let collectonView: DigioCollectionView = {
        let collectionView = DigioCollectionView(
            sections: [],
            contentInset: .init(top: 0, left: 8, bottom: 0, right: 8),
            minimumCellSpacing: 8
        )
        collectionView.scrollDirection = .horizontal
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with products: [Product]) {
        let section = ProductsSection(products: products)
        collectonView.update(sections: [section])
    }
    
}

extension ProductsView: CodeView {
    func buildViewHierarchy() {
        addSubview(collectonView)
    }
    
    func setupConstraints() {
        collectonView.bindFrameToSuperviewBounds()
    }
}
