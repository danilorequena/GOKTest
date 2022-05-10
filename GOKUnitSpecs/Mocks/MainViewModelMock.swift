//
//  MainViewModelMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

final class MainViewModelMock: MainViewModelProtocol {
    private(set) var hasCalledFetchData = false
    private(set) var hasCalledGoToSpotlight = false
    private(set) var hasCalledGoToBanner = false
    private(set) var hasCalledgGoToProduct = false

    func fetchData() {
        hasCalledFetchData = true
    }
    
    func goToSpotlight(spotlight: Spotlight) {
        hasCalledGoToSpotlight = true
    }
    
    func goToBanner(banner: Cash) {
        hasCalledGoToBanner = true
    }
    
    func goToProduct(product: Product) {
        hasCalledgGoToProduct = true
    }
}
