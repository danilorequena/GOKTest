//
//  CashView.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

protocol CashViewDelegate: AnyObject {
    func didTapImage()
}

final class CashView: UIView {
    weak var delegate: CashViewDelegate?
    var bannerData: Cash?
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        return stackView
    }()
    
    private let title = UILabel.Factory.build(
        textStyle: .headline,
        accessibilityIdentifier: "title",
        textColor: .black
    )
    
    private var cashView: UIImageView = {
        let imageView = UIImageView.Factory.build(
            contentMode: .scaleAspectFit,
            accessibilityIdentifier: "cashView"
        )
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(banner: Cash) {
        title.text = banner.title
        title.applyColor(at: "Cash", color: UIColor.lightGray)
        cashView.download(from: banner.bannerURL, placeHolder: UIImage(named: "noImage"))
        bannerData = banner
    }
    
    @objc
    private func tappedImage() {
        delegate?.didTapImage()
    }
}

extension CashView: CodeView {
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews(title, cashView)
    }
    
    func setupConstraints() {
        stackView.bindFrameToSuperviewBounds()
        title.anchor(height: 22)
        cashView.anchor(height: 110)
    }
    
    func setupAdditionalConfiguration() {
        cashView.clipsToBounds = true
        cashView.layer.cornerRadius = 16
        cashView.dropShadow(
            offset: CGSize(width: 2, height: 3),
            radius: 4,
            opacity: 0.2,
            color: UIColor.lightGray.cgColor
        )
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedImage)))
    }
}
