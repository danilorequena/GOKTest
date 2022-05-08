//
//  CashView.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

final class CashView: UIView {
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
    
    func setup(banner: String) {
        cashView.download(from: banner, placeHolder: UIImage(named: ""))
    }
}

extension CashView: CodeView {
    func buildViewHierarchy() {
        addSubview(cashView)
    }
    
    func setupConstraints() {
        cashView.bindFrameToSuperviewBounds()
    }
}
