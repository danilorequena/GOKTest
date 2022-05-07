//
//  Model.swift
//  GOKTest
//
//  Created by Danilo Requena on 28/08/20.
//

import Foundation

// MARK: - Spotlight
struct Spotlight: Codable {
    let name: String
    let bannerURL: String
    let spotlightDescription: String

    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case spotlightDescription = "description"
    }
}
