//
//  Protocols.swift
//  Tasks
//
//  Created by amela on 22/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

struct Kvadrat : Geometrija {
    var x : Double
    var y : Double
    
    var sirina : Double
    var visina : Double
    
    func ploscina () -> Double {
        return sirina * visina
    }
    
    mutating func povecaj(faktor: Double) {
        sirina *= faktor
        visina *= faktor
    }
}

protocol Geometrija {
    func ploscina () -> Double
    mutating func povecaj (faktor : Double)
}

func printKvadrat () {
    var kvadrat1 = Kvadrat(x: 1.0, y: 10.0, sirina: 30.0, visina: 30.0)
    var kvadrat2 = Kvadrat(x: 5.0, y: 10.0, sirina: 40.0, visina: 40.0)
    
    print("Ploscina 1: \(kvadrat1.ploscina())")
    print("Ploscina 2: \(kvadrat2.ploscina())")
    
    kvadrat2.povecaj(2)
    print("Ploscina 2: \(kvadrat2.ploscina())")
}