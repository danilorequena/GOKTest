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
//        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
//        setupView()
    }
    
    func commomInit() {
        Bundle.main.loadNibNamed("CashView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setupView(logo: Cash) {
        if let logoPath = logo.bannerURL {
            guard let data = try? Data(contentsOf: URL(string: logoPath)!) else { return }
            self.imageCash.image = UIImage(data: data)
            self.imageCash.layer.cornerRadius = 10
        }
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        layer.shadowRadius = 5.0
//        layer.shadowOpacity = 1.0
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//        layer.backgroundColor = UIColor.clear.cgColor
//        contentView.layer.masksToBounds = true
//        layer.cornerRadius = 10
        
    }

}

