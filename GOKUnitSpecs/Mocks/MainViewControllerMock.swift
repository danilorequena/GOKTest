//
//  MainViewControllerMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

final class MainViewControllerMock: MainViewControllerProtocol {
    private(set) var hasCalledShowBanners = false
    
    func showBanners(data: DigioModel) {
        hasCalledShowBanners = true
    }
}
