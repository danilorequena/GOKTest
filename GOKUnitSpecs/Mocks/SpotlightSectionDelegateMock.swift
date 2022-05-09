//
//  SpotlightSectionDelegateMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest
import Quick
import Nimble

final class SpotlightSectionDelegateMock: SpotlightViewSectionDelegate {
    private(set) var hasCalledDidSelectSpotlight = false
    
    func didSelectSpotlight(spotlight: Spotlight) {
        hasCalledDidSelectSpotlight = true
    }
}
