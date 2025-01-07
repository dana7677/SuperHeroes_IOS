//
//  TableViewCell.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class SuperHeroViewCell: UICollectionViewCell {

    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var ImgHero: UIImageView!
    @IBOutlet weak var CardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        CardView.layer.shadowColor = UIColor.black.cgColor
        CardView.layer.shadowOpacity = 0.5
        CardView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        CardView.layer.shadowRadius = 2.0
    }
    
    func render(_ dataHero:DataHero){
        nameHero.text = dataHero.name
        ImgHero.loadFrom(url: dataHero.image.url)
        
    }

}
