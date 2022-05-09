//
//  DetailViewModel.swift
//  GOKTest
//
//  Created by Danilo Requena on 09/05/22.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func setupData()
}

final class DetailViewModel: DetailViewModelProtocol {
    weak var view: DetailViewControllerProtocol?
    private let bannerURL: String
    private let descriptionText: String
    
    init(bannerURL: String, descriptionText: String) {
        self.bannerURL = bannerURL
        self.descriptionText = descriptionText
    }
    
    func setupData() {
        view?.setupScreen(bannerURL: bannerURL, descriptionText: descriptionText)
    }
}
