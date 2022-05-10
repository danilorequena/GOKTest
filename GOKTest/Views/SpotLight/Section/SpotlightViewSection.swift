//
//  SpotlightViewSection.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

protocol SpotlightViewSectionDelegate: AnyObject {
    func didSelectSpotlight(spotlight: Spotlight)
}

final class SpotlightViewSection: Section {
    weak var delegate: SpotlightViewSectionDelegate?
    private let spotlights: [Spotlight]
    
    init(spotlights: [Spotlight]) {
        self.spotlights = spotlights
    }
    
    func numberOfItemsInSection() -> Int {
        spotlights.count
    }
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(SpotlightCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SpotlightCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let banners = spotlights[indexPath.item]
        cell.setupCell(url: banners.bannerURL)
        return cell
    }
    
    func cellSize(with collectionViewBounds: CGRect, at indexPath: IndexPath) -> CGSize {
        .init(width: collectionViewBounds.width - 32, height: 180)
    }
    
    func sectionInsets(in section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func headerSize(width: CGFloat, in section: Int) -> CGSize {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let spotlight = spotlights[indexPath.item]
        delegate?.didSelectSpotlight(spotlight: spotlight)
    }
}
