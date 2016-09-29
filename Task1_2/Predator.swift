//
//  Predator.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Predator: Animal {

    private (set) var weight: Int
    
    var isProtecting: Bool {
        get {
            return arc4random_uniform(2) == 0
        }
    }
    
    override var description: String {
        get {
            return "Predator " + name + " [cal: \(calories), weight: \(weight)]"
        }
    }

    init(name: String, weight: Int) {
        self.weight = weight
        super.init(name: name, calories: Creature.defalutPredatorCalories)
    }
    
}
