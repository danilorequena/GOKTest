//
//  CashView.swift
//  GOKTest
//
//  Created by Danilo Requena on 31/08/20.
//

import UIKit

class CashView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageCash: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
    }
    
    func commomInit() {
        Bundle.main.loadNibNamed("CashView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setupView(logo: Cash) {
        if let logoPath = logo.bannerURL {
            do {
                let data = try Data(contentsOf: URL(string: logoPath)!)
                self.imageCash.image = UIImage(data: data)
                self.imageCash.layer.cornerRadius = 10
            } catch {
                self.imageCash.image = UIImage(named: "noImage")
                self.imageCash.layer.cornerRadius = 10
            }
        }
    }

}

