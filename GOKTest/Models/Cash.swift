//
//  Cash.swift
//  GOKTest
//
//  Created by Danilo Requena on 28/08/20.
//

import Foundation

// MARK: - Cash
struct Cash: Codable {
    let title: String
    let bannerURL: String
    let cashDescription: String

    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case cashDescription = "description"
    }
}
