//
//  MainViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit
import EMTNeumorphicView

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
        spotLightCollectionView.register(CashCollectionViewCell.loadNib(), forCellWithReuseIdentifier: CashCollectionViewCell.identifier())
        
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        spotLightCollectionView.delegate = self
        spotLightCollectionView.dataSource = self
        
        (productsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: 110, height: 110)
        (spotLightCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: 300, height: 160)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productsCollectionView {
            return viewModel?.listProdutcs.count ?? 1
        } else if collectionView == self.spotLightCollectionView {
            return viewModel?.listSpotlight.count ?? 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.productsCollectionView {
            let cellProducts = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier(), for: indexPath) as! MainCollectionViewCell
            let data = viewModel?.listProdutcs[indexPath.item]
            cellProducts.setupCell(logo: data!)
            cellProducts.backgroundColor = .white
            return cellProducts
        } else {
            let cellSpotlight = collectionView.dequeueReusableCell(withReuseIdentifier: CashCollectionViewCell.identifier(), for: indexPath) as! CashCollectionViewCell
            let data = viewModel?.listSpotlight[indexPath.item]
            cellSpotlight.setupCell(logo: data!)
            return cellSpotlight
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
                self.spotLightCollectionView.reloadData()
                print("caiu aqui")
            }
        }
        
    }
