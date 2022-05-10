//
//  DetailViewController.swift
//  GOKTest
//
//  Created by Danilo Requena on 08/05/22.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func setupScreen(bannerURL: String, descriptionText: String)
}

final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModelProtocol
    private let bannerImageView = UIImageView.Factory.build(
        contentMode: .scaleAspectFill,
        accessibilityIdentifier: "bannerImage"
    )
    
    private let descriptionLabel = UILabel.Factory.build(
        textStyle: .headline,
        numberOfLines: 0,
        accessibilityIdentifier: "description",
        textColor: .black
    )
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.setupData()
    }
}

extension DetailViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubviews(bannerImageView, descriptionLabel)
    }
    
    func setupConstraints() {
        bannerImageView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            insets: .init(top: 8, left: 16, bottom: 0, right: 16)
        )
        bannerImageView.anchor(height: 200)
        
        descriptionLabel.anchor(
            top: bannerImageView.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            insets: .init(top: 16, left: 16, bottom: 0, right: 16)
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupScreen(bannerURL: String, descriptionText: String) {
        bannerImageView.download(from: bannerURL, placeHolder: UIImage(named: "noImage"))
        descriptionLabel.text = descriptionText
    }
}
