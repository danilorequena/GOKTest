//
//  MainView.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import UIKit

final class MainView: UIView {
    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.register(SpotlightTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88
        return tableView
    }()
    
    private lazy var tableViewManager: MainViewManager = {
        let tableViewManager = MainViewManager()
        tableView.delegate = tableViewManager
        tableView.dataSource = tableViewManager
//        tableViewManager.delegate = self
        tableViewManager.register(tableView)
        return tableViewManager
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        tableView.delegate = tableViewManager
        tableView.dataSource = tableViewManager
        tableView.reloadData()
    }
}

extension MainView: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
