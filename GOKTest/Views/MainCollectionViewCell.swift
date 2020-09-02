//
//  MainCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
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
    
    func setupCell(logo: Products) {
        if let logoPath = logo.imageURL {
            do {
                let data = try Data(contentsOf: URL(string: logoPath)!)
                self.image.image = UIImage(data: data)
                self.image.layer.cornerRadius = 10
            } catch {
                self.image.image = UIImage(named: "noImage")
                self.image.layer.cornerRadius = 10
            }
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
