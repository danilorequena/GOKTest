//
//  ModelBase.swift
//  GOKTest
//
//  Created by Danilo Requena on 28/08/20.
//

import Foundation

// MARK: - DigioModel
struct DigioModel: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}
