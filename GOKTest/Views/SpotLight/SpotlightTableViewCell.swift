//
//  SpotlightTableViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class SpotlightTableViewCell: UITableViewCell {
    
    private let spotlightView = SpotlightView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SpotlightTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(spotlightView)
    }
    
    func setupConstraints() {
        spotlightView.bindFrameToSuperviewBounds()
    }
}
