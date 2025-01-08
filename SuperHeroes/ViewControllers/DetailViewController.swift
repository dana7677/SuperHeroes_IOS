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
    
    
    //InfoSuperHeroe
    @IBOutlet weak var BioStack: UIStackView!
    @IBOutlet weak var BioFullName: UILabel!
    @IBOutlet weak var BioAlterEgo: UILabel!
    @IBOutlet weak var BioAlias: UILabel!
    @IBOutlet weak var BioPlaceBirth: UILabel!
    @IBOutlet weak var BioFirstAppearance: UILabel!
    @IBOutlet weak var BioPublisher: UILabel!
    @IBOutlet weak var BioAlignment: UILabel!
    
    @IBOutlet weak var AppearanceStack: UIStackView!
    @IBOutlet weak var AppearGender: UILabel!
    @IBOutlet weak var AppearRace: UILabel!
    @IBOutlet weak var AppearHeight: UILabel!
    @IBOutlet weak var AppearWeight: UILabel!
    @IBOutlet weak var AppearEyesColor: UILabel!
    @IBOutlet weak var AppearHairColor: UILabel!
    
    @IBOutlet weak var WorkStack: UIStackView!
    @IBOutlet weak var WorkOccupation: UILabel!
    @IBOutlet weak var WorkBase: UILabel!
    
    @IBOutlet weak var ConnectionsStack: UIStackView!
    @IBOutlet weak var ConnectionsGroup: UILabel!
    @IBOutlet weak var ConnectionsRelatives: UILabel!
    
    //MARK: Segmented Control
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func SenderChange(_ sender: UISegmentedControl)
    {
        switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                changeStaxViewToShow(BioStack)
                case 1:
                changeStaxViewToShow(AppearanceStack)
                case 2:
                changeStaxViewToShow(WorkStack)
                case 3:
                changeStaxViewToShow(ConnectionsStack)
                default:
                    break;
                }
    }
    func changeStaxViewToShow(_ stackView:UIStackView)
    {
        
        BioStack.isHidden = true
        WorkStack.isHidden = true
        ConnectionsStack.isHidden = true
        AppearanceStack.isHidden = true
        stackView.isHidden = false
        
    }
    
    //MARK: InitialData
    
    var superHeroe:DataHero!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        navigationItem.title = superHeroe.name
        NameDetailHero.text = superHeroe.biography.alias[0]
        ImgDetailHero.loadFrom(url: superHeroe.image.url)
        
        setInfoHeroes()
      

        
        //Animation Start for get the value from the bar
        
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
    
    
    
    
    //MARK: Logic For Set Data
    
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
    
    func setInfoHeroes()
    {
        //Bio
        setMultipleLine("Alias: ",superHeroe.biography.alias, BioAlias)
        setLine("Alignment: ",superHeroe.biography.alignment, BioAlignment)
        setLine("Publisher: ",superHeroe.biography.publisher, BioPublisher)
        setLine("AlterEgo: ",superHeroe.biography.alterEgo, BioAlterEgo)
        setLine("FullName: ",superHeroe.biography.fullName, BioFullName)
        setLine("Place Of Birth: ",superHeroe.biography.placeBirth, BioPlaceBirth)
        setLine("First Appearance: ",superHeroe.biography.firstAppearance, BioFirstAppearance)
        //Appear
        setLine("Race: ",superHeroe.appearance.race, AppearRace)
        setLine("Gender: ",superHeroe.appearance.gender, AppearGender)
        setMultipleLine("Height: ",superHeroe.appearance.height, AppearHeight)
        setMultipleLine("Weight: ",superHeroe.appearance.weight, AppearWeight)
        setLine("Eyes Color: ",superHeroe.appearance.eyesColor, AppearEyesColor)
        setLine("Hair Color: ",superHeroe.appearance.hairColor, AppearHairColor)
        
        
        //Work
        setLine("Base: ",superHeroe.work.base, WorkBase)
        setLine("Occupation: ",superHeroe.work.occupation, WorkOccupation)
        //Connections
        setLine("Group: ",superHeroe.connections.group, ConnectionsGroup)
        setLine("Relatives: ",superHeroe.connections.relatives, ConnectionsRelatives)
         
        
    }
    func setMultipleLine(_ intro: String,_ text: Array<String>, _ labelPass:UILabel)
    {
        if (text.isEmpty)
        {
            labelPass.text="No result"
        }
        else
        {
            var StringNew=intro
            
            for x in text
            {
                StringNew=StringNew + " " + x
            }
            
            labelPass.text=StringNew
        }
    }
    
    func setLine(_ intro: String, _ text: String, _ labelPass:UILabel)
    {
        if (text.isEmpty || text == "-")
        {
            labelPass.text="No result"
        }
        else
        {
            labelPass.text = intro + text
        }
        
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
