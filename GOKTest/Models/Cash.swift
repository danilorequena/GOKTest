//
//  Cash.swift
//  GOKTest
//
//  Created by Danilo Requena on 28/08/20.
//

import Foundation

struct Cash : Codable {
    let title : String?
    let bannerURL : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case bannerURL = "bannerURL"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        bannerURL = try values.decodeIfPresent(String.self, forKey: .bannerURL)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
