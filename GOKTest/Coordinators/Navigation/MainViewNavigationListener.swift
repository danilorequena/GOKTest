//
//  File.swift
//  GOKTest
//
//  Created by Danilo Requena on 09/05/22.
//

import Foundation

protocol MainViewNavigationListener: AnyObject {
    func goToSpotLight(spotlight: Spotlight)
    func goToBanner(banner: Cash)
    func goToProduct(product: Product)
}
