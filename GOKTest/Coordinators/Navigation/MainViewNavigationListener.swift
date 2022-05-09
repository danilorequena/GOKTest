//
//  File.swift
//  GOKTest
//
//  Created by Danilo Requena on 09/05/22.
//

import Foundation

protocol MainViewNavigationListener: AnyObject {
    func goToSpotLight(spotlight: Spotlight)
    func goToCash(cash: Cash)
    func goToProduct(product: Product)
}
