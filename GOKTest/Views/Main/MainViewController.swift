//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func showBanners()
}

final class MainViewController: UIViewController {
    private let viewModel: MainViewModelProtocol
    private lazy var mainView: MainView = {
       let view = MainView()
        return view
    }()
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.fetchData()
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

extension MainViewController: MainViewControllerProtocol {
    func showBanners() {
        mainView.updateView()
    }
}
