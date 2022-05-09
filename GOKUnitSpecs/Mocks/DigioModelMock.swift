//
//  DigioModelMock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

extension DigioModel {
    static func mock() -> DigioModel {
        DigioModel(
            spotlight: [
                Spotlight(
                    name: "teste",
                    bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                    spotlightDescription: "teste"
                ),
                Spotlight(
                    name: "teste",
                    bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                    spotlightDescription: "teste"
                )
            ],
            products: [
                Product(
                    name: "teste",
                    imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                    productDescription: "teste"
                ),
                Product(
                    name: "teste",
                    imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                    productDescription: "teste"
                ),
                Product(
                    name: "teste",
                    imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                    productDescription: "teste"
                )
            ],
            cash: Cash(
                title: "teste",
                bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                cashDescription: "teste"
            )
        )
    }
}
