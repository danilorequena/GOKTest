//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

final class MainViewController: UIViewController {
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension MainViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(mainView)
    }
    
    func setupConstraints() {
        mainView.bindFrameToSuperviewBounds()
    }
    
    
}
