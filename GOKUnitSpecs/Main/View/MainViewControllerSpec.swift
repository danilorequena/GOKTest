//
//  MainViewControllerSpec.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import GOKTest

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        describe("MainViewController") {
            var sut: MainViewController!
            var mainViewModelMock: MainViewModelMock!
            
            beforeEach {
                mainViewModelMock = .init()
                sut = .init(viewModel: mainViewModelMock)
            }
            
            context("when receive data") {
                beforeEach {
                    sut.showBanners(data: DigioModel.mock())
                }
                
                it("has to look and feel") {
                    expect(sut) == snapshot()
                }
            }
            
            context("when receive error") {
                beforeEach {
                    sut.hideBanners()
                }
                
                it("has to look and feel") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
