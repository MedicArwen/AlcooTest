//
//  InfoVC.swift
//  AlcooTest
//
//  Created by etudiant-16 on 21/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
var userInfo = Drinker()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onButtonFermerClick(_ sender: UIButton) {
        performSegue(withIdentifier: "InfoToMain", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoToMain"
        {
            if let destinationVC = segue.destination as? MainVC
            {
                destinationVC.user = userInfo
            }
        }
    }
    
}
