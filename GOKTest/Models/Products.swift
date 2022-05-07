//
//  Products.swift
//  GOKTest
//
//  Created by Danilo Requena on 28/08/20.
//

import Foundation

struct Product: Codable {
    let name: String
    let imageURL: String
    let productDescription: String

    enum CodingKeys: String, CodingKey {
        case name, imageURL
        case productDescription = "description"
    }
}
