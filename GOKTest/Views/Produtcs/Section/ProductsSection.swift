//
//  ProductsSection.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

protocol ProductsSectionDelegate: AnyObject {
    func didTapProduct(product: Product)
}

final class ProductsSection: Section {
    weak var delegate: ProductsSectionDelegate?
    private let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    func numberOfItemsInSection() -> Int {
        products.count
    }
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(ProductsCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductsCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let product = products[indexPath.item]
        cell.setupCell(with: product)
        return cell
    }
    
    func cellSize(with collectionViewBounds: CGRect, at indexPath: IndexPath) -> CGSize {
        .init(width: 100, height: 100)
    }
    
    func sectionInsets(in section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func headerSize(width: CGFloat, in section: Int) -> CGSize {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        delegate?.didTapProduct(product: product)
    }
}
