//
//  ListCoordinator.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

@available(iOS 13.0, *)
class ListCoordinator : Coordinator  {
    private  let presenter: UINavigationController
    private  var mainViewController: MainViewController?
    let viewModel = MainViewModel()
    
    init (presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: viewModel)
        
        viewModel.view = mainViewController
        mainViewController.title = "Main list"
        presenter.pushViewController(mainViewController, animated: true)
        
        self.mainViewController = mainViewController
    }
}

