//
//  Cash+Mock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

extension Cash {
    static func mock() -> Cash {
        Cash(
            title: "Teste",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
            cashDescription: "teste"
        )
    }
}
