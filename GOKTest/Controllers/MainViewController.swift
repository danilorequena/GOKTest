//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func MainViewControllerDidSelectList(_ selectedList: ModelBase)
}

class MainViewController: UIViewController {
    weak var delegate: MainViewControllerDelegate?
    
    @IBOutlet weak var spotLightCollectionView: UICollectionView!
    @IBOutlet weak var cashCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!

    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        setupCollectionView()
        viewModel?.delegate = self
        viewModel?.fetchData()
    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView() {
        productsCollectionView.register(MainCollectionViewCell.loadNib(), forCellWithReuseIdentifier: MainCollectionViewCell.identifier())
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productsCollectionView {
            return viewModel?.list.count ?? 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProducts = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier(), for: indexPath) as! MainCollectionViewCell
        if collectionView == self.productsCollectionView {
            let data = viewModel?.list[indexPath.item]
            cellProducts.setupCell(logo: data!)
            return cellProducts
        } else {
            return cellProducts
        }
    }
    
    
}

extension MainViewController: MainViewModelDelegate {
        
        func errorList(error message: String) {
            DispatchQueue.main.async {
                self.productsCollectionView.reloadData()
            }
        }
        
        func successList() {
            DispatchQueue.main.async {
                self.productsCollectionView.reloadData()
                print("caiu aqui")
            }
        }
        
    }
