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
        self.shadowDefault()
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
    }

}
