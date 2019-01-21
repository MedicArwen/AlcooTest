//
//  Utilities.swift
//  TipCalculator
//
//  Created by Mehdi Chennoufi on 09/11/2017.
//  Copyright © 2017 CCi Indre. All rights reserved.
//

import Foundation
import UIKit

// Fonction pour formatter un caractère numérique saisie dans un champs de texte
func stringToDouble(_ string: String) -> Double? {
    return NumberFormatter().number(from: string)?.doubleValue
}

/// Convertit un Double en String
///
/// - parameter myDouble:   Double en entrée
/// - parameter nbOfDigits: Nombre exact de chiffres après la virgule.
///
/// - returns: La String en résultat
func doubleToString(myDouble: Double, nbOfDigits: Int) -> String? {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = nbOfDigits
    formatter.minimumFractionDigits = nbOfDigits
    
    if let output = formatter.string(from: NSNumber(value:myDouble)) {
        return output
    } else {
        return nil
    }
}

// Extension de la structure Double afin de formatter un nombre décimal en String
extension Double {
    var toFormattedString : String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        if let output = formatter.string(from: NSNumber(value:self)) {
            return output
        } else {
            return nil
        }
    }
}
