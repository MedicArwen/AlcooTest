//
//  Profil.swift
//  AlcooTest
//
//  Created by etudiant-16 on 22/01/2019.
//  Copyright © 2019 Networked Hells. All rights reserved.
//

import Foundation
class Profil
{
    var weight: Int
    var nbOfGllasses = [Int]()
    var gender: Gender
    init() {
        let userWeight = UserDefaults.standard.integer(forKey: "weight")
        if userWeight != 0 {
            self.weight = userWeight
        }
        else
        {
            self.weight = 60
        }
        let userGender = UserDefaults.standard.integer(forKey: "gender")
        if userGender == 0 , userGender == 1 {
            self.gender = Gender(rawValue: userGender)!
        }
        else
        {
            self.gender = .man
        }
    }
    func reloadData()
    {
        let userWeight = UserDefaults.standard.integer(forKey: "weight")
        if userWeight != 0 {
            self.weight = userWeight
        }
        else
        {
            self.weight = 60
        }
        let userGender = UserDefaults.standard.integer(forKey: "gender")
        if userGender == 0 , userGender == 1 {
            self.gender = Gender(rawValue: userGender)!
        }
        else
        {
            self.gender = .man
        }
    }
    func getAlcoolrateInBlood(drinks: [Drink])->Double
    {
        var tauxAlcool = 0.0
        var ratio: Double
        if gender == .man { ratio = 0.7}
        else
        {ratio = 0.6}
        
        for (index,drink) in drinks.enumerated(){
            tauxAlcool += (Double(self.nbOfGllasses[index]) * drink.sizeGlass * drink.alcoholRate * 0.8) / (Double(self.weight)*ratio)
        }
        return tauxAlcool
    }
    func drinkSomething(alcoolIndex: Int, glassCount: Int)
    {
        self.nbOfGllasses[alcoolIndex] = glassCount
    }
    func saveDataUser()
    {
        UserDefaults.standard.set(self.gender.rawValue, forKey: "gender")
        UserDefaults.standard.set(self.weight, forKey: "weight")
    }
}
