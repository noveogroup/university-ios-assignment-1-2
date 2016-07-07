//
//  EatingRules.m
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "RulesOfLife.h"
#import "Garbage.h"
#import "Grass.h"
#import "Herbivorous.h"
#import "Predator.h"
#import "Animal.h"
#import "Forest.h"

@implementation RulesOfLife

+ (BOOL)can:(ForestObject *)first eat:(ForestObject *)second withCalories:(float *)cal {
    
    if ([first respondsToSelector:@selector(eat:calories:)]) {
        
        if ([first isKindOfClass:[Predator class]] &&
            [second isKindOfClass:[Predator class]]) {
            
            Predator *p1 = (Predator *)first;
            Predator *p2 = (Predator *)second;
            
            if (p1.weight > p2.weight && ![p2 isDefending] && p1 != p2) {
                
                *cal = p2.calories / 2;
                return YES;
            }
            
        } else if ([first isKindOfClass:[Predator class]] &&
                   [second isKindOfClass:[Herbivorous class]]) {
            
            Herbivorous *h = (Herbivorous *)second;
            
            if (![h isHiding]) {
                
                *cal = h.calories / 2;
                return YES;
            }
            
        } else if ([first isKindOfClass:[Herbivorous class]] &&
                   [second isKindOfClass:[Grass class]]) {
            
            *cal = second.calories;
            return YES;
            
        } else if (([first isKindOfClass:[Predator class]] || [first isKindOfClass:[Herbivorous class]]) && [second isKindOfClass:[Garbage class]]) {
            
            *cal = second.calories;
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)isEnd {
    
    int npredators = 0;
    int nherbivorouses = 0;
    int ngarbage = 0;
    
    for (ForestObject *object in [Forest sharedForest].objects) {
        
        if ([object isKindOfClass:[Predator class]]) {
            
            npredators++;
        }
        else if ([object isKindOfClass:[Herbivorous class]]) {
            
            nherbivorouses++;
        }
        else if ([object isKindOfClass:[Garbage class]]) {
            
            ngarbage++;
        }
    }
    
    if (npredators == 1 && nherbivorouses == 0 && ngarbage == 0) {
        
        return YES;
    }
    
    return NO;
}

@end
















