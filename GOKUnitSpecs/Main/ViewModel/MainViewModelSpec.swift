//
//  MainViewModelSpec.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

import Quick
import Nimble
@testable import GOKTest

class MainViewModelSpec: QuickSpec {
    override func spec() {
        describe("MainViewModel") {
            var sut: MainViewModel!
            var mainServiceMock: MainServiceMock!
            var mainViewControllerMock: MainViewControllerMock!
            var navigationListenerMock: MainNavigationListenerMock!
            
            beforeEach {
                navigationListenerMock = .init()
                mainViewControllerMock = .init()
                mainServiceMock = .init()
                sut = .init(service: mainServiceMock)
                sut.view = mainViewControllerMock
                sut.navigationListener = navigationListenerMock
                
            }
            
            context("when receive data") {
                beforeEach {
                    mainServiceMock.dataResult = .success(DigioModel.mock())
                    sut.fetchData()
                }
                
                it("has to look and feel") {
                    expect(mainViewControllerMock.hasCalledShowBanners) == true
                }
            }
            
            context("goToSpotLight") {
                beforeEach {
                    sut.goToSpotlight(spotlight: Spotlight.mock())
                }
                
                it("has to look and feel") {
                    expect(navigationListenerMock.goToSpotLightCalled) == true
                }
            }
            
            context("goToBanner") {
                beforeEach {
                    sut.goToBanner(banner: Cash.mock())
                }
                
                it("has to look and feel") {
                    expect(navigationListenerMock.goToBannerCalled) == true
                }
            }
            
            context("goToProduct") {
                beforeEach {
                    sut.goToProduct(product: Product.mock())
                }
                
                it("has to look and feel") {
                    expect(navigationListenerMock.goToProductCalled) == true
                }
            }
        }
    }
}

