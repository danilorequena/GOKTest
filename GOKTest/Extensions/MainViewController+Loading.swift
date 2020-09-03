//
//  MainViewController+Loading.swift
//  GOKTest
//
//  Created by Danilo Requena on 02/09/20.
//

import UIKit

fileprivate var aView: UIView?

extension MainViewController {
    func showLoad() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        
        let load = UIActivityIndicatorView(style: .large)
        load.center = aView!.center
        load.startAnimating()
        aView?.addSubview(load)
        self.view.addSubview(aView!)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.removeLoad()
        }
    }
    
    func removeLoad() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
