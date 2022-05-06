//
//  SpotlightView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class SpotlightView: UIView {
    private let collectionView: DigioCollectionView = {
        let collection = DigioCollectionView(
            sections: [],
            contentInset: .init(top: 0, left: 8, bottom: 0, right: 8),
            minimumCellSpacing: 8
        )
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
