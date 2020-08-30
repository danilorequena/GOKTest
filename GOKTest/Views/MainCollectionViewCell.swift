//
//  MainCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 29/08/20.
//

import UIKit

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
            guard let data = try? Data(contentsOf: URL(string: logoPath)!) else { return }
            self.image.image = UIImage(data: data)
        }
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0

        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = #colorLiteral(red: 0.9464526772, green: 0.9466111064, blue: 0.9464318156, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }

}
