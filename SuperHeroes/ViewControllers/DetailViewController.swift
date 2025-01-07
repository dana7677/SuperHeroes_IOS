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
    @IBOutlet weak var buttonPrueba: UIButton!
    
    @IBOutlet weak var InteligenceProgressBar: UIProgressView!
    @IBOutlet weak var StrenghtProgressBar: UIProgressView!
    @IBOutlet weak var CombatProgressBar: UIProgressView!
    @IBOutlet weak var PowerProgressBar: UIProgressView!
    @IBOutlet weak var DurabilityProgressBar: UIProgressView!
    @IBOutlet weak var SpeedProgressBar: UIProgressView!
    @IBOutlet weak var IntImgIcon: UIImageView!
    @IBOutlet weak var StrenghtImgIcon: UIImageView!
    @IBOutlet weak var CombatImgIcon: UIImageView!
    @IBOutlet weak var PowerImgIcon: UIImageView!
    @IBOutlet weak var DurabilityImgIcon: UIImageView!
    @IBOutlet weak var SpeedImgIcon: UIImageView!
    
    
    var superHeroe:DataHero!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonPrueba.bounce()
        
        navigationItem.title = superHeroe.name
        NameDetailHero.text = superHeroe.name
        ImgDetailHero.loadFrom(url: superHeroe.image.url)
        
      

        
        //IntImgIcon.tintColor = UIColor.colorLow
        
        starAnimations(InteligenceProgressBar,getNumberFloat(superHeroe.powerstats.intelligence))
        IntImgIcon.shine()
        IntImgIcon.jumpHorizontal()
        IntImgIcon.image = UIImage.inteligenceIcon
        IntImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.intelligence))

        
        starAnimations(StrenghtProgressBar,getNumberFloat(superHeroe.powerstats.strength))
        StrenghtImgIcon.shine()
        StrenghtImgIcon.jumpHorizontal()
        StrenghtImgIcon.image = UIImage.strenghtIcon
        StrenghtImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.strength))
        
        starAnimations(CombatProgressBar,getNumberFloat(superHeroe.powerstats.combat))
        CombatImgIcon.shine()
        CombatImgIcon.jumpHorizontal()
        CombatImgIcon.image = UIImage.combatIcon
        CombatImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.combat))
        
        starAnimations(PowerProgressBar,getNumberFloat(superHeroe.powerstats.power))
        PowerImgIcon.shine()
        PowerImgIcon.jumpHorizontal()
        PowerImgIcon.image = UIImage.powerIcon
        PowerImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.power))
        
        starAnimations(DurabilityProgressBar,getNumberFloat(superHeroe.powerstats.durability))
        DurabilityImgIcon.shine()
        DurabilityImgIcon.jumpHorizontal()
        DurabilityImgIcon.image = UIImage.hearthIcon
        DurabilityImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.durability))
        
        starAnimations(SpeedProgressBar,getNumberFloat(superHeroe.powerstats.speed))
        SpeedImgIcon.shine()
        SpeedImgIcon.jumpHorizontal()
        SpeedImgIcon.image = UIImage.speedIcon
        SpeedImgIcon.backgroundColor = setColor(getNumberFloat(superHeroe.powerstats.speed))
        
        
        
    }
    
    func getNumberFloat(_ wage:String)->Float{
        
        var wageFloat:Float = 0.0
        
        let wageNumber = NumberFormatter().number(from: wage)

        wageFloat = wageNumber!.floatValue
        wageFloat=wageFloat/100.0
       
        
        return wageFloat
        
    }
    func setColor(_ percent:Float)->UIColor{
        
        print(percent)
        
        switch percent{
            
        case ..<0.20:
            return UIColor.red
        case ..<0.40:
            return UIColor.orange
        case ..<0.60:
            return UIColor.yellow
        case ..<0.8:
            return UIColor.magenta
        case ..<1.01:
            return UIColor.green
        default:
            return UIColor.green
        }
    
    }
    
   
    
    func starAnimations(_ progressBar:UIProgressView, _ progressPercent:Float){
        
        progressBar.shine()
        progressBar.jumpHorizontal()
        progressBar.setProgress(progressPercent, animated: true)
        
        
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        buttonPrueba.bounce()
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
