//
//  MainViewManager.swift
//  GOKTest
//
//  Created by Danilo Requena on 06/05/22.
//

import Foundation
import UIKit

final class MainViewManager: NSObject {
    func register(_ tableView: UITableView) {
        tableView.register(SpotlightTableViewCell.self)
    }
}

extension MainViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SpotlightTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

extension MainViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
