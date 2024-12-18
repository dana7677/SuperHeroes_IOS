//
//  DetailViewController.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImgDetailHero: UIImageView!
    @IBOutlet weak var NameDetailHero: UILabel!
    
    var superHeroe:DataHero!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = superHeroe.name
        NameDetailHero.text = superHeroe.name
        ImgDetailHero.loadFrom(url: superHeroe.image.url)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
