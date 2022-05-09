//
//  RetryView.swift
//  GOKTest
//
//  Created by Danilo Requena on 09/05/22.
//

import UIKit

protocol RetryViewDelegate: AnyObject {
    func didTapReload()
}

final class RetryView: UIView {
    weak var delegate: RetryViewDelegate?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private let errorImage = UIImageView.Factory.build(
        image: UIImage(named: "errorImage"),
        contentMode: .scaleAspectFit,
        accessibilityIdentifier: "errorImage"
    )
    
    private let retryButton: UIButton = {
        let button = UIButton.Factory.build(
            title: "Recarregar",
            titleColor: UIColor.white,
            contentHorizontalAlignment: .center,
            backgroundColor: (.init(named: "bcColorButton") ?? .green),
            cornerRadius: 16,
            textStyle: .headline,
            accessibilityIdentifier: "retryButton"
        )
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func reload() {
        delegate?.didTapReload()
    }
}

extension RetryView: CodeView {
    func buildViewHierarchy() {
        addSubviews(errorImage, retryButton)
    }
    
    func setupConstraints() {
        errorImage.anchorCenterSuperview()
        errorImage.anchor(height: 200, width: 260)
        
        retryButton.anchor(
            top: errorImage.bottomAnchor,
            leading: errorImage.leadingAnchor,
            trailing: errorImage.trailingAnchor,
            insets: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        
        retryButton.anchor(height: 56)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .init(named: "bcColor")
    }
}
