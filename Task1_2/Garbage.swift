//
//  Garbage.swift
//  Task1_2
//
//  Created by Admin on 23/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Garbage: Creature {
    
    init() {
        super.init(calories: Creature.defaultGarbageCalories)
    }
    
    override var description: String {
        get {
            return "Garbage"
        }
    }
}

