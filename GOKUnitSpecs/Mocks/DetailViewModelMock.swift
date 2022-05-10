//
//  DetailViewModelMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

final class DetailViewModelMock: DetailViewModelProtocol {
    private(set) var hasCalledSetupData = false
    
    func setupData() {
        hasCalledSetupData = true
    }
}
