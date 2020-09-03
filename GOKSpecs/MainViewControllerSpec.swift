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
            let controller = MainViewController()
            var sut: CashView?
            
            beforeSuite {
                controller.loadViewIfNeeded()
                controller.viewDidLoad()
                controller.beginAppearanceTransition(true, animated: false)
                controller.endAppearanceTransition()
                sut = controller.cashViewBanner
            }
            
            context("Check MainViewController is not Nil") {
                it("is not nil") {
                    expect(controller).toNot(beNil())
                    expect(sut).toNot(beNil())
                }
            }
        }
    }
}
