//
//  DetailViewControllerSpec.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable
import GOKTest

final class DetailViewControllerSpec: QuickSpec {
    override func spec() {
        describe("DetailViewController") {
            var sut: DetailViewController!
            var viewModelMock: DetailViewModelMock!
            
            beforeEach {
                viewModelMock = .init()
                sut = .init(viewModel: viewModelMock)
            }
            
            context("when receive data") {
                beforeEach {
                    sut.setupScreen(bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png", descriptionText: "Teste")
                }
                
                it("has to look and feel") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
