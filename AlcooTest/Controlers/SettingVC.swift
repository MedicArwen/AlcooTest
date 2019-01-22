//
//  SettingVC.swift
//  AlcooTest
//
//  Created by etudiant-16 on 21/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    var genre: Gender = .man
    var poid: Int = 60
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
        if UserDefaults.standard.integer(forKey: "gender") == 0
        {
            genre = .man
        }
        else
        {
            genre = .woman
        }
        poid = UserDefaults.standard.integer(forKey: "weight")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("will appear")
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
        case 0: genre = .woman
        case 1: genre  = .man
        default: break
        }
        updateVisualSelector()
    }
    
    func updateVisualSelector()
    {
        if genre == .woman
        {
            femaleSelector.alpha = 1.0
            maleSelector.alpha = 0.70
        }
        else
        {
            femaleSelector.alpha = 0.70
            maleSelector.alpha = 1.0
        }
        
        // pickerView.selectRow(Int(userSetting.wreightDrinker-59), inComponent: 1, animated: true)
    }
    @IBAction func buttonValidateSettingTapped(_ sender: UIButton) {
        
        UserDefaults.standard.set(genre.rawValue, forKey: "gender")
        UserDefaults.standard.set(poid, forKey: "weight")
        
        
    }
    
    @IBAction func functionRetourTapped(_ sender: UIButton) {
        self.dismiss(animated: true) {
        }
        
    }
    
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
        poid = (row + 59)
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerDataSource[row], attributes: [NSMutableAttributedString.Key.foregroundColor: UIColor.white])
    }
}
