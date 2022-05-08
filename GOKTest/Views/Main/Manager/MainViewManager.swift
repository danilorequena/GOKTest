////
////  MainViewManager.swift
////  GOKTest
////
////  Created by Danilo Requena on 06/05/22.
////
//
//import UIKit
//
//final class MainViewManager: NSObject {
//    private var data: DigioModel
//    
//    init(data: DigioModel) {
//        self.data = data
//    }
//}
//
//extension MainViewManager: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: SpotlightTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
//        let spotlights = data.spotlight
//        cell.setupCell(spotlights: spotlights)
//        return cell
//    }
//}
//
//extension MainViewManager: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
//}
