//
//  Spotlight+Mock.swift
//  GOKUnitSpecs
//
//  Created by Danilo Requena on 09/05/22.
//

@testable
import GOKTest

extension Spotlight {
    static func mock() -> Spotlight {
        Spotlight(
            name: "Teste",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
            spotlightDescription: "teste"
        )
    }
}
