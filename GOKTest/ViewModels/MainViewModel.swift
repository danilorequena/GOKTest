//
//  MainViewModel.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func fetchData()
    func goToSpotlight(spotlight: Spotlight)
}

protocol MainViewModelDelegate: AnyObject {
    func successList()
    func errorList(error: String)
}

final class MainViewModel: MainViewModelProtocol {
    weak var view: MainViewControllerProtocol?
    weak var navigationListener: MainViewNavigationListener?
    private let service: MainServiceProtocol
    
    init(service: MainServiceProtocol = MainService()) {
        self.service = service
    }
    

    func fetchData() {
        service.fetchDiscoverMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.view?.showBanners(data: data)
            case let .failure(error):
                print("deu errado")
            }
        }
    }
    
    func goToSpotlight(spotlight: Spotlight) {
        navigationListener?.goToSpotLight(spotlight: spotlight)
    }
}



