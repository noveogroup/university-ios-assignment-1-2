//
//  EatingRules.m
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "RulesOfLife.h"
#import "Grass.h"
#import "Herbivorous.h"
#import "Predator.h"
#import "Forest.h"

@implementation RulesOfLife

+ (BOOL)can:(LivingBeing *)firstLivingBeing eat:(LivingBeing *)secondLivingBeing {
    
    if ([firstLivingBeing isKindOfClass:[Predator class]] &&
        [secondLivingBeing isKindOfClass:[Predator class]]) {
        
        Predator *p1 = (Predator *)firstLivingBeing;
        Predator *p2 = (Predator *)secondLivingBeing;
        
        if (p1.weight > p2.weight && ![p2 isDefending] && p1 != p2) {
            
            return YES;
        }
        
    } else if ([firstLivingBeing isKindOfClass:[Predator class]] &&
               [secondLivingBeing isKindOfClass:[Herbivorous class]]) {
        
        Herbivorous *h = (Herbivorous *)secondLivingBeing;
        
        if (![h isHiding]) {
            
            return YES;
        }
        
    } else if ([firstLivingBeing isKindOfClass:[Herbivorous class]] &&
               [secondLivingBeing isKindOfClass:[Grass class]]) {
        
        return YES;
    }
    
    return NO;
}

+ (BOOL)isEnd {
    
    int npredators = 0;
    int nherbivorouses = 0;
    
    for (LivingBeing *livingBeing in [Forest sharedForest].livingBeings) {
        
        if ([livingBeing isKindOfClass:[Predator class]]) {
            
            npredators++;
        }
        else if ([livingBeing isKindOfClass:[Herbivorous class]]) {
            
            nherbivorouses++;
        }
    }
    
    if (npredators == 1 && nherbivorouses == 0) {
        
        return YES;
    }
    
    return NO;
}

@end
















