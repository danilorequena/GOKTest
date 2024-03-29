//
//  SpotlightView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

protocol SpotlightViewDelegate: AnyObject {
    func didTapSpotlight(spotlight: Spotlight)
}

final class SpotlightView: UIView {
    weak var delegate: SpotlightViewDelegate?
    private let collectionView: DigioCollectionView = {
        let collection = DigioCollectionView(
            sections: [],
            contentInset: .init(top: 0, left: 8, bottom: 0, right: 8),
            minimumCellSpacing: 16
        )
        collection.scrollDirection = .horizontal
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(spotlights: [Spotlight]) {
        let section = SpotlightViewSection(spotlights: spotlights)
        section.delegate = self
        collectionView.update(sections: [section])
    }
}

extension SpotlightView: CodeView {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.bindFrameToSuperviewBounds()
    }
}

extension SpotlightView: SpotlightViewSectionDelegate {
    func didSelectSpotlight(spotlight: Spotlight) {
        delegate?.didTapSpotlight(spotlight: spotlight)
    }
}
