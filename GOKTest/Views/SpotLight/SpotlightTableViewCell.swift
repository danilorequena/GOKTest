//
//  SpotlightTableViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class SpotlightTableViewCell: UITableViewCell {
    private let collectionView: DigioCollectionView = {
        let collection = DigioCollectionView(
            sections: [],
            contentInset: .init(top: 0, left: 8, bottom: 0, right: 8),
            minimumCellSpacing: 10
        )
        collection.scrollDirection = .horizontal
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(spotlights: [Spotlight]) {
        let section = SpotlightViewSection(spotlights: spotlights)
        collectionView.update(sections: [section])
    }

}

extension SpotlightTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.bindFrameToSuperviewBounds()
    }
}
