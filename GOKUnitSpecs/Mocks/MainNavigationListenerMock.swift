//
//  MainNavigationListenerMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

final class MainNavigationListenerMock: MainViewNavigationListener {
    private(set) var goToSpotLightCalled = false
    private(set) var goToBannerCalled = false
    private(set) var goToProductCalled = false
    
    func goToSpotLight(spotlight: Spotlight) {
        goToSpotLightCalled = true
    }
    
    func goToBanner(banner: Cash) {
        goToBannerCalled = true
    }
    
    func goToProduct(product: Product) {
        goToProductCalled = true
    }
}
