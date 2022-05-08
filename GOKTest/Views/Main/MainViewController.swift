//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func showBanners(data: DigioModel)
}

final class MainViewController: UIViewController {
    private let viewModel: MainViewModelProtocol
    private let mainView = MainView()
    
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
        navigationController?.setNavigationBarHidden(true, animated: false)
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
    func showBanners(data: DigioModel) {
        mainView.updateView(data: data)
    }
}
