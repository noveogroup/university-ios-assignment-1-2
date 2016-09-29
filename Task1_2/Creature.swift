//
//  Creature.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Creature {
    
    static let defalutPredatorCalories: Int = 100
    static let defaultHerbivoreCalories: Int = 50
    static let defaultPlantCalories: Int = 10
    static let defaultGarbageCalories: Int = -1
    
    var calories: Int = 0
    var description: String {
        get {
            return "Some creature"
        }
    }
    
    init(calories: Int) {
        self.calories = calories
    }
    
    
}
