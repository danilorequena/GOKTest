//
//  CashCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 30/08/20.
//

import UIKit

class CashCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cashImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func loadNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    func setupCell(logo: Spotlight) {
        if let logoPath = logo.bannerURL {
            guard let data = try? Data(contentsOf: URL(string: logoPath)!) else { return }
            self.cashImage.image = UIImage(data: data)
            self.cashImage.layer.cornerRadius = 10
        }
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        
    }

}
