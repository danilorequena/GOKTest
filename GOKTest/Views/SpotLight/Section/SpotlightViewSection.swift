//
//  SpotlightViewSection.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class SpotlightViewSection: Section {
    
    
    func numberOfItemsInSection() -> Int {
        1
    }
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(SpotlightCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SpotlightCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
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
}


