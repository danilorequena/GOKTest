//
//  Product+Mock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

extension Product {
    static func mock() -> Product {
        Product(
            name: "teste",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
            productDescription: "Teste"
        )
    }
    
    static func mockArray() -> [Product] {
        [
            Product(
                name: "teste",
                imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                productDescription: "Teste"
            ), Product(
                name: "teste",
                imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                productDescription: "Teste"
            ), Product(
                name: "teste",
                imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                productDescription: "Teste"
            )
        ]
    }
}
