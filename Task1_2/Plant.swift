//
//  Plant.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Plant: Creature, Nameable {

    private (set) var name: String

    override var description: String {
        get {
            return "Plant " + name
        }
    }
    
    init(name: String) {
        self.name = name
        super.init(calories: Creature.defaultPlantCalories)
    }

}
