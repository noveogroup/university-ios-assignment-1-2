//
//  Forest.swift
//  Task1_2
//
//  Created by Admin on 22/09/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Forest {
    //I like this almost one line singleton announcement ;)
    static let instance = Forest()
    
    //answer enum from CanEat method
    enum CanEatResponse {
        case yes(calories: Int)
        case no
        //kind of hack for checking that answer is yes
        var isYes: Bool {
            switch self {
            case .yes(_):
                return true
            default:
                return false
            }
        }
    }

    //an util enum for creating random creatures
    enum CreatureType: Int {
        case Predator, Herbivore, Plant, Garbage
        
        static func getRandom() -> CreatureType {
            return CreatureType.init(rawValue: Int(arc4random_uniform(UInt32(4))))!
        }
    }
    
    //forest rule: a function that determs can creature1 eats creature2 or not + calories in response (if yes)
    typealias EatRule = ((Creature, Creature) -> CanEatResponse?)
    
    private var creatures: [Creature]
    private var rules: [EatRule]
    
    private init() {

        creatures = [Creature]()
        
        //init rules
        rules = [EatRule]()
        rules.append(
            { creature1, creature2 in
                if (creature1 is Herbivore) && (creature2 is Plant) {
                    return CanEatResponse.yes(calories: (creature2 as! Plant).calories)
                }
                return CanEatResponse.no
        })
        rules.append(
            { creature1, creature2 in
                if (creature1 is Predator) && (creature2 is Herbivore) {
                    if !(creature2 as! Herbivore).isHiding {
                        return CanEatResponse.yes(calories: Int((creature2 as! Herbivore).calories / 2))
                    }
                }
                return CanEatResponse.no
        })
        rules.append(
            { creature1, creature2 in
                if (creature1 is Predator) && (creature2 is Predator) {
                    if (creature1 as! Predator).weight > (creature2 as! Predator).weight &&
                        !(creature2 as! Predator).isProtecting {
                            return CanEatResponse.yes(calories: Int((creature2 as! Predator).calories / 2))
                    }
                }
                return CanEatResponse.no
        })
        rules.append(
            { creature1, creature2 in
                if (creature1 is Animal) && (creature2 is Garbage) {
                    return CanEatResponse.yes(calories: (creature2 as! Garbage).calories)
                }
                return CanEatResponse.no
        })
        
        initDefaultCreatures()
        //initRandomCreators()
    }
    
    func initDefaultCreatures() {
        creatures.append(Plant(name: "Flower"))
        creatures.append(Plant(name: "Leafs"))
        creatures.append(Plant(name: "Carrot"))
        creatures.append(Herbivore(name: "Rabbit"))
        creatures.append(Herbivore(name: "Zebra"))
        creatures.append(Herbivore(name: "Cow"))
        creatures.append(Predator(name: "Wolf", weight: 60))
        creatures.append(Predator(name: "Fox", weight: 40))
        creatures.append(Predator(name: "Bear", weight: 300))
        creatures.append(Garbage())
        creatures.append(Garbage())
        creatures.append(Garbage())
    }
    
    func initRandomCreators() {
        let creaturesCount = randomInt(min: 15, max: 20)
        print("Init \(creaturesCount) creatures")
        
        for i in 0..<creaturesCount {
            let creatureType = (i == 0) ? CreatureType.Predator : CreatureType.getRandom()
            var creature: Creature
            
            switch creatureType {
            case .Plant:
                creature = Plant(name: "Plant \(i)")
                
            case .Herbivore:
                creature = Herbivore(name: "Herbivore \(i)")

            case .Predator:
                creature = Predator(name: "Predator \(i)", weight: randomInt(min: 20, max: 300))
                
            default :
                creature = Garbage()
            }
            
            creatures.append(creature)
        }
    }
    
    func simulate() {
        var day: Int = 0
        
        while !isLastPredator() {
            day += 1
            print("Day \(day):")
            simulateDay()
            print()
        }
        
        
        if let theLastPredator = creatures.filter({$0 is Predator})[0] as? Predator {
            print(theLastPredator.showStomack())
        }
    }
    
    private func simulateDay() {
        
        if !isLastPredator() && creatures.count > 1 {
            var creature1: Creature
            var creature2: Creature
            var randomIndex: Int
            
            //select Creature 1
            repeat {
                randomIndex = randomInt(min: 0, max: creatures.count - 1)
                creature1 = creatures[randomIndex]
            } while !(creature1 is Animal)
            
            //select Creature 2
            repeat {
                randomIndex = randomInt(min: 0, max: creatures.count - 1)
                creature2 = creatures[randomIndex]
            } while creature2 === creature1
            
            //to eat or not to eat?
            let eatResult = canEat(creature1: creature1, creature2: creature2)
            
            switch (eatResult) {
            case let .yes(calories):
                print("\(creature1.description) ate \(creature2.description) and got \(calories) calories")
                (creature1 as! Animal).eat(creature: creature2, calories: calories)
                //is there a better way to remove an item?
                creatures = creatures.filter({$0 !== creature2})
                print("Now it's " + creature1.description)
            case .no:
                print("\(creature1.description) can't eat \(creature2.description)")
            }
        }
        
    }
    

    
    private func isLastPredator() -> Bool {
        var predatorsCount: Int = 0
        var herbivoresCount: Int = 0
        for creature in creatures {
            if (creature is Predator) {
                predatorsCount += 1
            } else if (creature is Herbivore) {
                herbivoresCount += 1
            }
        }
        return predatorsCount == 1 && herbivoresCount == 0
    }
    
    private func canEat(creature1: Creature, creature2: Creature) -> CanEatResponse {
        for eatRule in rules {
            if let response = eatRule(creature1, creature2) {
                if response.isYes {
                    return response
                }
            }
        }
        return CanEatResponse.no
    }
    
    //util func for get random Int
    private func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}
