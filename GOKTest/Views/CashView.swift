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
    @IBOutlet weak var titleLabel: UILabel!
    
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
        setupLabel()
    }
    
    func setupLabel() {
        let string = NSMutableAttributedString()
        let attibutes1 = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor(red: 44.0/255.0, green: 50.0/255.0, blue: 70.0/255.0, alpha: 1)]
        let attibutes2 = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.lightGray]
        
        string.append(NSAttributedString(string: "digio ", attributes: attibutes1))
        string.append(NSAttributedString(string: "cash", attributes: attibutes2))
        self.titleLabel.attributedText = string 
    }

}

