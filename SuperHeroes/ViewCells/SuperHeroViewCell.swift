//
//  TableViewCell.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class SuperHeroViewCell: UITableViewCell {

    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var ImgHero: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(_ dataHero:DataHero){
        nameHero.text = dataHero.name
        ImgHero.loadFrom(url: dataHero.image.url)
        
    }

}
