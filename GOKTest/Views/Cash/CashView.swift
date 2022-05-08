//
//  CashView.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class CashView: UIView {
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private let title = UILabel.Factory.build(
        textStyle: .headline,
        accessibilityIdentifier: "title",
        textColor: .black
    )
    
    private var cashView = UIImageView.Factory.build(
        contentMode: .scaleAspectFit,
        accessibilityIdentifier: "cashView"
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(banner: Cash) {
        title.text = banner.title
        cashView.download(from: banner.bannerURL, placeHolder: UIImage(named: ""))
    }
}

extension CashView: CodeView {
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews(title, cashView)
    }
    
    func setupConstraints() {
        stackView.bindFrameToSuperviewBounds()
    }
}
