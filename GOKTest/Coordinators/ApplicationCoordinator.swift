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
        rootViewController.pushViewController (mainViewController, animated: false )
    }
    
    func  start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible ()
    }
}

