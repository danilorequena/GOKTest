//
//  DetailViewControllerMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

final class DetailViewControllerMock: DetailViewControllerProtocol {
    private(set) var hasCalledSetupScreen = false
    
    func setupScreen(bannerURL: String, descriptionText: String) {
        hasCalledSetupScreen = true
    }
}

