//
//  Herbivore.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Herbivore: Animal {
    
    init(name: String) {
        super.init(name: name, calories: Creature.defaultHerbivoreCalories)
    }
    
    override var description: String {
        get {
            return "Herbivore " + name + " [cal: \(calories)]"
        }
    }
    
    var isHiding: Bool {
        get {
            return arc4random_uniform(2) == 0
        }
    }
    
    
    
}
