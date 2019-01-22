//
//  drinker.swift
//  AlcooTest
//
//  Created by etudiant-16 on 21/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import Foundation

struct Drinker {
    var nbBeer = 0
    var nbWine = 0
    var nbWhiskey = 0
    var nbVodka = 0
    var sexDrinker = "m"
    var wreightDrinker = 60.0
    func getEstimatedAlcoolRate ()->Double
    {
        if sexDrinker == "f"
        {
            return ((alcoolBeer() + alcoolWine() + alcoolWhiskey() + alcoolVodka()) * 0.8 ) / ( wreightDrinker * 0.6)
        }
        else
        {
            return ((alcoolBeer() + alcoolWine() + alcoolWhiskey() + alcoolVodka()) * 0.8 ) / ( wreightDrinker * 0.7)
        }
    }
    func alcoolBeer()->Double
    {
        return 0.05 * Double(nbBeer) * 330
    }
    func alcoolWine()->Double
    {
        return 0.06 * Double(nbWine) * 120
    }
    func alcoolWhiskey()->Double
    {
        return 0.45 * Double(nbWhiskey) * 40
    }
    func alcoolVodka()->Double
    {
        return 0.45 * Double(nbVodka) * 60
    }
}
