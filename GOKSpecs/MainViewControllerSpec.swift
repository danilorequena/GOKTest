//
//  MainViewControllerSpec.swift
//  GOKTestTests2
//
//  Created by Danilo Requena on 03/09/20.
//

import Quick
import Nimble
import UIKit
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
                    sut.viewDidLoad()
                }
                
                it("has to look and feel") {
//                    expect(sut) == recordSnapshot()
                }
            }
        }
    }
}
