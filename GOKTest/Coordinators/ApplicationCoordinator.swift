//
//  ApplicationCoordinator.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    
    init (window: UIWindow ) {
        self .window = window
        rootViewController = UINavigationController ()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        
        let viewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: viewModel)
        
        viewModel.view = mainViewController
        viewModel.navigationListener = self
        rootViewController.pushViewController (mainViewController, animated: false )
    }
    
    func  start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible ()
    }
}

extension ApplicationCoordinator: MainViewNavigationListener {
    func goToSpotLight(spotlight: Spotlight) {
        let viewModel = DetailViewModel(bannerURL: spotlight.bannerURL, descriptionText: spotlight.spotlightDescription)
        let viewController = DetailViewController(viewModel: viewModel)
        viewModel.view = viewController
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    func goToBanner(banner: Cash) {
        let viewModel = DetailViewModel(bannerURL: banner.bannerURL, descriptionText: banner.cashDescription)
        let viewController = DetailViewController(viewModel: viewModel)
        viewModel.view = viewController
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    func goToProduct(product: Product) {
        
    }
}

