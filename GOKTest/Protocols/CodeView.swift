//
//  CodeView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

public protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    public func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    public func setupAdditionalConfiguration() {}
}
