//
//  ViewController.swift
//  AlcooTest
//
//  Created by etudiant-16 on 18/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    var user = Drinker()
    @IBOutlet weak var beerCount: UILabel!
    @IBOutlet weak var wineCount: UILabel!
    @IBOutlet weak var whiskeyCount: UILabel!
    @IBOutlet weak var vodkaCount: UILabel!
    
    
    @IBOutlet weak var valeurEstimationText: UILabel!
    
    @IBOutlet weak var iconeMortBourre: UIImageView!
    
    
    @IBOutlet weak var stepperBeer: UIStepper!
    @IBOutlet weak var stepperWine: UIStepper!
    @IBOutlet weak var stepperWhiskey: UIStepper!
    @IBOutlet weak var stepperVodka: UIStepper!
    
    override func viewWillAppear(_ animated: Bool) {
        refreshViewOnDrinkerChange()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func activateStepperClick(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            user.nbBeer = Int(sender.value)
        case 1:
            user.nbWine = Int(sender.value)
        case 2:
            user.nbWhiskey = Int(sender.value)
        case 3:
            user.nbVodka = Int(sender.value)
        default:
            break
        }
        refreshViewOnDrinkerChange()
        
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
        user.nbBeer = 0
        user.nbWine = 0
        user.nbWhiskey = 0
        user.nbVodka = 0
        refreshViewOnDrinkerChange()
    }
    
    @IBAction func buttonSettingTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "seguesToSettings", sender: self)
    }
    
    
    @IBAction func onButtonInfoClick(_ sender: UIButton) {
        performSegue(withIdentifier: "MainToInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguesToSettings"
        {
            if let destinationVC = segue.destination as? SettingVC
            {
                destinationVC.userSetting = user
            }
        }
        if segue.identifier == "MainToInfo"
            {
                if let destinationVC = segue.destination as? InfoVC
                {
                    destinationVC.userInfo = user
                }
        }
    }
    
    func refreshViewOnDrinkerChange()
    {
        stepperBeer.value = Double(user.nbBeer)
        stepperWine.value = Double(user.nbWine)
        stepperWhiskey.value = Double(user.nbWhiskey)
        stepperVodka.value = Double(user.nbVodka)
        
        beerCount.text = String(user.nbBeer)
        wineCount.text = String(user.nbWine)
        whiskeyCount.text = String(user.nbWhiskey)
        vodkaCount.text = String(user.nbVodka)
        valeurEstimationText.text = doubleToString(myDouble: user.getEstimatedAlcoolRate() , nbOfDigits: 2)! + " g/L"
        
        if user.getEstimatedAlcoolRate() > 0.49
        {
            iconeMortBourre.isHidden = false
            valeurEstimationText.textColor = UIColor.red
        }
        else
        {
            iconeMortBourre.isHidden = true
            valeurEstimationText.textColor = UIColor.white
        }
    }
    
    
}

