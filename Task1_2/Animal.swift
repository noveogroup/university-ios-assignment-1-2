//
//  Animal.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Animal: Creature, Nameable {
    
    private (set) var name: String
    private (set) var stomack: [Creature]
    
   
    init (name: String, calories: Int) {
        self.name = name
        stomack = [Creature]()
        super.init(calories: calories)
    }
    
    func isProtected() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    func eat(creature: Creature, calories: Int) {
        self.calories += calories
        stomack.append(creature)
    }
    
    func showStomack(spacePrefix: String = "") -> String {
        var s = spacePrefix + name + ":\n"
        let nextSpacePrefix = spacePrefix + "  "
        for creature in stomack {
            let creatureDescription: String = creature is Animal ? (creature as! Animal).showStomack(spacePrefix: nextSpacePrefix) : nextSpacePrefix + creature.description
            s += creatureDescription
            if !s.hasSuffix("\n") {
                s += "\n"
            }
            
        }
        return s
    }
    
}
