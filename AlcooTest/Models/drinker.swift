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
    var sexDrinker = "f"
    var wreightDrinker = 60.0
    func getEstimatedAlcoolRate ()->Double
    {
        if sexDrinker == "f"
        {
            return ((alcoolBeer() + alcoolWine() + alcoolWhiskey() + alcoolVodka()) * 0.8) / ( wreightDrinker/100 * 0.6)
        }
        else
        {
            return ((alcoolBeer() + alcoolWine() + alcoolWhiskey() + alcoolVodka()) * 0.8) / ( wreightDrinker/100 * 0.7)
        }
    }
    func alcoolBeer()->Double
    {
        return 0.1 * Double(nbBeer) * 0.33
    }
    func alcoolWine()->Double
    {
        return 0.06 * Double(nbWine) * 0.12
    }
    func alcoolWhiskey()->Double
    {
        return 0.45 * Double(nbWhiskey) * 0.4
    }
    func alcoolVodka()->Double
    {
        return 0.45 * Double(nbVodka) * 0.6
    }
}
