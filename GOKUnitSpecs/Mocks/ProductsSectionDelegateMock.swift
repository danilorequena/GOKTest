//
//  ProductsSectionDelegateMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest
import Quick
import Nimble

final class ProductsSectionDelegateMock: ProductsSectionDelegate {
    private(set) var hasCalledDidTapProduct = false
    
    func didTapProduct(product: Product) {
        hasCalledDidTapProduct = true
    }
}
