//
//  DetailViewModelSpec.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

import Quick
import Nimble
@testable import GOKTest

class DetailViewModelSpec: QuickSpec {
    override func spec() {
        describe("DetailViewModel") {
            var sut: DetailViewModel!
            var detailViewControllerMock: DetailViewControllerMock!
            
            beforeEach {
                detailViewControllerMock = .init()
                sut = .init(bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png", descriptionText: "Text")
                sut.view = detailViewControllerMock
            }
            
            context("when receive data") {
                beforeEach {
                    sut.setupData()
                }
                
                it("has to look and feel") {
                    expect(detailViewControllerMock.hasCalledSetupScreen) == true
                }
            }
        }
    }
}
