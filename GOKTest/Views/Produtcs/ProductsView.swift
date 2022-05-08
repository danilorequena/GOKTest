//
//  ProductsView.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class ProductsView: UIView {
    private let title = UILabel.Factory.build(
        text: "Produtos",
        textAlignment: .left,
        textStyle: .headline,
        accessibilityIdentifier: "title",
        textColor: .black
    )
    
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
        addSubviews(title, collectonView)
    }
    
    func setupConstraints() {
        title.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            insets: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
        
        collectonView.anchor(
            top: title.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            insets: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        collectonView.anchor(height: 110)
    }
}
