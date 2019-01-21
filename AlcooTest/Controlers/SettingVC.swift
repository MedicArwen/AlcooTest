//
//  SettingVC.swift
//  AlcooTest
//
//  Created by etudiant-16 on 21/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var userSetting = Drinker()
    var pickerDataSource = ["59 Kg"];
    
    @IBOutlet weak var femaleSelector: UIButton!
    @IBOutlet weak var maleSelector: UIButton!
    
    @IBOutlet weak var testlabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        for i in 60...120
        {
            pickerDataSource.append(String(i)+" Kg")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
     updateVisualSelector()
     //   pickerWeight.
    }
    

    @IBOutlet weak var weightSelector: UIPickerView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onclickMaleFemale(_ sender: UIButton) {
    switch sender.tag {
        case 0: userSetting.sexDrinker = "f"
        case 1: userSetting.sexDrinker = "m"
        default: break
        }
        updateVisualSelector()
    }
    
    func updateVisualSelector()
    {
        if userSetting.sexDrinker == "f"
        {
            femaleSelector.alpha = 1.0
            maleSelector.alpha = 0.70
            testlabel.text = "female"
        }
        else
        {
            femaleSelector.alpha = 0.70
            maleSelector.alpha = 1.0
            testlabel.text = "male"
        }
    }
    @IBAction func buttonValidateSettingTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "seguesToMain", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguesToMain"
        {
            if let destinationVC = segue.destination as? MainVC
            {
                destinationVC.user = userSetting
            }
        }
    }
    /*
     @IBAction func buttonSettingTapped(_ sender: UIButton) {
     performSegue(withIdentifier: "seguesToMain", sender: self)
     }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
     }
 */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return pickerDataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSetting.wreightDrinker = Double(row + 59)
        testlabel.text = doubleToString(myDouble: userSetting.wreightDrinker, nbOfDigits: 2)
    }
}
