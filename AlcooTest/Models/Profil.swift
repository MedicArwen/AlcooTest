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
        print("init")
        let userWeight = UserDefaults.standard.integer(forKey: "weight")
        if userWeight != 0 {
            self.weight = userWeight
        }
        else
        {
            self.weight = 60
        }
        print(UserDefaults.standard.integer(forKey: "gender"))
        let userGender = UserDefaults.standard.integer(forKey: "gender")
        if (userGender == 0) || (userGender == 1) {
            self.gender = Gender(rawValue: userGender)!
            print("trouve un genre:")
            print(Gender(rawValue: userGender)!)
        }
        else
        {
            print("pas trouvé le genre")
            self.gender = .man
        }
        saveDataUser()
        print("end init")
    }
    func getGender()->Gender?
    {
        return Gender(rawValue: UserDefaults.standard.integer(forKey: "gender"))
    }
    func getWeight()->Int
    {
        return UserDefaults.standard.integer(forKey: "weight")
    }
    
    func getAlcoolrateInBlood(drinks: [Drink])->Double
    {
        print("getAlcoolrateInBlood")
        var tauxAlcool = 0.0
        var ratio: Double
        if let gender = getGender()
        {
            if gender == .man { ratio = 0.7
                print("un mec")
            }
            else
            {ratio = 0.6
                print("une nana")
            }
            
            for (index,drink) in drinks.enumerated(){
                tauxAlcool += (Double(self.nbOfGllasses[index]) * drink.sizeGlass * drink.alcoholRate * 0.8) / (Double(self.weight)*ratio)
            }
        }
        print(" end getAlcoolrateInBlood")
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
