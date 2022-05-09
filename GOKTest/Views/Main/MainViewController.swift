//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func showBanners(data: DigioModel)
    func hideBanners()
}

final class MainViewController: UIViewController {
    private let viewModel: MainViewModelProtocol
    private let mainView = MainView()
    private let retryView: RetryView = {
        let view = RetryView()
        
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
        mainView.delegate = self
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MainViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubviews(mainView, retryView)
    }
    
    func setupConstraints() {
        mainView.bindFrameToSuperviewBounds()
        retryView.bindFrameToSuperviewBounds()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func showBanners(data: DigioModel) {
        retryView.isHidden = true
        mainView.isHidden = false
        mainView.updateView(data: data)
    }
    
    func hideBanners() {
        retryView.isHidden = false
        mainView.isHidden = true
    }
    
    func setupAdditionalConfiguration() {
        retryView.delegate = self
    }
}

extension MainViewController: MainViewDelegate, RetryViewDelegate {
    func didTapSpotlight(spotlight: Spotlight) {
        viewModel.goToSpotlight(spotlight: spotlight)
    }
    
    func didTapBanner(bannerData: Cash) {
        viewModel.goToBanner(banner: bannerData)
    }
    
    func didTapProduct(product: Product) {
        viewModel.goToProduct(product: product)
    }
    
    func didTapReload() {
        viewModel.fetchData()
    }
}
