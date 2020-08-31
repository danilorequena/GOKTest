//
//  MainViewModel.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func fetchData()
}

protocol MainViewModelDelegate: AnyObject {
    func successList()
    func errorList(error: String)
}

class MainViewModel: MainViewModelProtocol {
    weak var delegate: MainViewModelDelegate?
    var listProdutcs: [Products] = []
    var listSpotlight: [Spotlight] = []
    func fetchData() {
        ListStorage.loadList(urlString: Constants.urlPath) { (lists) in
            self.listProdutcs += lists.products!
            self.listSpotlight += lists.spotlight!
            self.delegate?.successList()
        } onError: { (error) in
            self.delegate?.errorList(error: "\(error)")
        }
    }
}
