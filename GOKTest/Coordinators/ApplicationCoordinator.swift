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
  
    @available(iOS 13.0, *)
    init (window: UIWindow ) {
    self .window = window
    rootViewController = UINavigationController ()
    rootViewController.navigationBar.prefersLargeTitles = true
    
    let mainViewController = MainViewController()
    rootViewController.pushViewController (mainViewController, animated: false )
  }
  
  func  start() {
    window.rootViewController = rootViewController
    window.makeKeyAndVisible ()
  }
}

