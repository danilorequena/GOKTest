//
//  DetailViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class DetailViewController: UIViewController {
    private let bannerImageView = UIImageView.Factory.build(
        contentMode: .scaleToFill,
        accessibilityIdentifier: "bannerImage"
    )
    
    private let descriptionLabel = UILabel.Factory.build(
        textStyle: .subheadline,
        numberOfLines: 0,
        accessibilityIdentifier: "description",
        textColor: .black,
        adjustsFontSizeToFitWidth: true,
        minimumScaleFactor: 0.8
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension DetailViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubviews(bannerImageView, descriptionLabel)
    }
    
    func setupConstraints() {
        bannerImageView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            insets: .init(top: 8, left: 16, bottom: 0, right: 16)
        )
        
        descriptionLabel.anchor(
            top: bannerImageView.bottomAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            insets: .init(top: 16, left: 16, bottom: 16, right: 16)
        )
    }
}
