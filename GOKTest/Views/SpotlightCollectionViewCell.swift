//
//  CashCollectionViewCell.swift
//  GOKTest
//
//  Created by Danilo Requena on 30/08/20.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var spotlightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.shadowDefault()
    }
    
    class func loadNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
    func setupCell(logo: Spotlight) {
        if let logoPath = logo.bannerURL {
            do {
                let data = try Data(contentsOf: URL(string: logoPath)!)
                self.spotlightImage.image = UIImage(data: data)
                self.spotlightImage.layer.cornerRadius = 10
            } catch {
                self.spotlightImage.image = UIImage(named: "noImage")
                self.spotlightImage.layer.cornerRadius = 10
            }
        }
    }

}
