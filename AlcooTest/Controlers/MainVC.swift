//
//  ViewController.swift
//  AlcooTest
//
//  Created by etudiant-16 on 18/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
   
    @IBOutlet weak var beerCount: UILabel!
    @IBOutlet weak var wineCount: UILabel!
    @IBOutlet weak var whiskeyCount: UILabel!
    @IBOutlet weak var vodkaCount: UILabel!
    
    @IBOutlet var listGlassesCounter: [UILabel]!
    
    @IBOutlet weak var valeurEstimationText: UILabel!
    
    @IBOutlet weak var iconeMortBourre: UIImageView!
    
    @IBOutlet var listOfDrinkStepper: [UIStepper]!
    
    
    @IBOutlet weak var stepperBeer: UIStepper!
    @IBOutlet weak var stepperWine: UIStepper!
    @IBOutlet weak var stepperWhiskey: UIStepper!
    @IBOutlet weak var stepperVodka: UIStepper!
 
    @IBOutlet var test: [UILabel]!
    
    var actuelProfil = Profil()
    var drinkList = [Drink]()
    
    override func viewWillAppear(_ animated: Bool) {
        print ("will appear reload profil")
        refreshViewOnDrinkerChange()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        actuelProfil.nbOfGllasses = [0,0,0,0]
        drinkList.append(Drink(name:"Beer",alcoholRate: 0.04,sizeGlass: 330))
        drinkList.append(Drink(name:"Whiskey",alcoholRate: 0.4,sizeGlass: 50))
        drinkList.append(Drink(name:"Wine",alcoholRate: 0.12,sizeGlass: 120))
        drinkList.append(Drink(name:"Vodka",alcoholRate: 0.4,sizeGlass: 40))
    }
    
    @IBAction func activateStepperClick(_ sender: UIStepper) {
       /* switch sender.tag {
        case 0:
           // user.nbBeer = Int(sender.value)
            actuelProfil.drinkSomething(alcoolIndex: 0, glassCount: Int(sender.value))
        case 1:
            //user.nbWine = Int(sender.value)
            actuelProfil.drinkSomething(alcoolIndex: 0, glassCount: Int(sender.value))
        case 2:
            //user.nbWhiskey = Int(sender.value)
            actuelProfil.drinkSomething(alcoolIndex: 0, glassCount: Int(sender.value))
        case 3:
           // user.nbVodka = Int(sender.value)
            actuelProfil.drinkSomething(alcoolIndex: 0, glassCount: Int(sender.value))
        default:
            break
        }*/
         actuelProfil.drinkSomething(alcoolIndex: sender.tag, glassCount: Int(sender.value))
        print(sender.tag)
        print(listGlassesCounter.count)
        print(listGlassesCounter[sender.tag])
        listGlassesCounter[sender.tag].text =  "\(Int(sender.value))"
        refreshViewOnDrinkerChange()
        
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
         actuelProfil.nbOfGllasses[0] = 0
        actuelProfil.nbOfGllasses[1] = 0
        actuelProfil.nbOfGllasses[2] = 0
        actuelProfil.nbOfGllasses[3] = 0
        refreshViewOnDrinkerChange()
    }
    
    @IBAction func buttonSettingTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "seguesToSettings", sender: self)
    }
    
    
    @IBAction func onButtonInfoClick(_ sender: UIButton) {
        performSegue(withIdentifier: "MainToInfo", sender: self)
    }
    

    
    func refreshViewOnDrinkerChange()
    {
       /* stepperBeer.value = Double(user.nbBeer)
        stepperWine.value = Double(user.nbWine)
        stepperWhiskey.value = Double(user.nbWhiskey)
        stepperVodka.value = Double(user.nbVodka)
        
        beerCount.text = String(user.nbBeer)
        wineCount.text = String(user.nbWine)
        whiskeyCount.text = String(user.nbWhiskey)
        vodkaCount.text = String(user.nbVodka)*/
        for (index,drinked) in actuelProfil.nbOfGllasses.enumerated()
        {
            listGlassesCounter[index].text = "\(drinked)"
            listOfDrinkStepper[index].value = Double(drinked)
        }
       // valeurEstimationText.text = doubleToString(myDouble: user.getEstimatedAlcoolRate() , nbOfDigits: 2)! + " g/L"
        let tauxAlcool = actuelProfil.getAlcoolrateInBlood(drinks:drinkList)
        valeurEstimationText.text = String(format: "%0.2f",tauxAlcool) + " g/L"
    
        
        if tauxAlcool > 0.49
        {
            iconeMortBourre.isHidden = false
            valeurEstimationText.textColor = UIColor.red
            let alertControleur = UIAlertController(title: "ATTENTION COUZIN", message: "Tu as trop BU! INTERDIT DE ROULER", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertControleur.addAction(okAction)
            present(alertControleur,animated: true)
        }
        else
        {
            iconeMortBourre.isHidden = true
            valeurEstimationText.textColor = UIColor.white
        }
    }
    
    
}

