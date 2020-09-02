//
//  MainViewModel.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func fetchDataCollections()
}

protocol MainViewModelDelegate: AnyObject {
    func successList()
    func errorList(error: String)
}

class MainViewModel: MainViewModelProtocol {
    weak var delegate: MainViewModelDelegate?
    var listProdutcs: [Products] = []
    var listSpotlight: [Spotlight] = []
    var cashData: Cash?

    func fetchDataCollections() {
        Service.loadList(urlString: Constants.urlPath) { (lists) in
            self.listProdutcs += lists.products!
            self.listSpotlight += lists.spotlight!
            self.cashData = lists.cash
            self.delegate?.successList()
        } onError: { (error) in
            self.delegate?.errorList(error: "\(error)")
        }
    }
}
