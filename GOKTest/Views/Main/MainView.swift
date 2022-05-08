//
//  MainView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class MainView: UIView {
    private let title = UILabel.Factory.build(
        text: "Olá Danilo",
        textAlignment: .left,
        textStyle: .headline,
        numberOfLines: 1,
        accessibilityIdentifier: "title",
        textColor: .black
    )
    
    private let spotlightView = SpotlightView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(data: DigioModel) {
        spotlightView.setup(spotlights: data.spotlight)
    }
}

extension MainView: CodeView {
    func buildViewHierarchy() {
        addSubviews(title, spotlightView)
    }
    
    func setupConstraints() {
        title.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            insets: .init(top: 8, left: 16, bottom: 0, right: 0)
        )
        
        spotlightView.anchor(
            top: title.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            insets: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        
        spotlightView.anchor(height: 200)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
