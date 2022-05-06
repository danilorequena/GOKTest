//
//  ListCoordinator.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

@available(iOS 13.0, *)
class ListCoordinator : Coordinator  {
    private  let presenter: UINavigationController // 1
//    private  let list: [ModelBase]   // 2
    private  var mainViewController: MainViewController?  // 3
    private  let storage: Service  // 4
    let viewModel = MainViewModel()
    
    init (presenter: UINavigationController , storage: Service ) {
        self.presenter = presenter
        self.storage = storage
//        self.list = viewModel.fetchData()   // 5
    }
    
    func start() {
        let mainViewController = MainViewController(nibName: nil , bundle: nil ) // 6
        mainViewController.title = "Main list"
//        mainViewController.list = list
        presenter.pushViewController (mainViewController, animated: true )   // 7
        
        self.mainViewController = mainViewController
    }
}

//extension ListCoordinator: KanjiListViewControllerDelegate {
//  func MainViewControllerDidSelectList(_ selectedList: Kanji) {
//    let listDetailCoordinator = KanjiDetailCoordinator(presenter: presenter, kanji: selectedKanji, kanjiStorage: kanjiStorage)
//    kanjiDetailCoordinator.start()
//
////    self.kanjiDetailCoordinator = kanjiDetailCoordinator
//  }
//}

