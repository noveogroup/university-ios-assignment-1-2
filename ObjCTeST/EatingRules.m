//
//  EatingRules.m
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "EatingRules.h"
#import "Grass.h"
#import "Herbivorous.h"
#import "Predator.h"

@implementation EatingRules

+ (BOOL)can:(LivingBeing *)firstLivingBeing eat:(LivingBeing *)secondLivingBeing {
    
    if ([firstLivingBeing class] == [Predator class] &&
        [secondLivingBeing class] == [Predator class]) {
        
        Predator *p1 = (Predator *)firstLivingBeing;
        Predator *p2 = (Predator *)secondLivingBeing;
        
        if (p1.weight > p2.weight && ![p2 isDefending] && p1 != p2) {
            
            return YES;
        }
        
    } else if ([firstLivingBeing class] == [Predator class] &&
               [secondLivingBeing class] == [Herbivorous class]) {
        
        Herbivorous *h = (Herbivorous *)secondLivingBeing;
        
        if (![h isHiding]) {
            
            return YES;
        }
        
    } else if ([firstLivingBeing class] == [Herbivorous class] &&
               [secondLivingBeing class] == [Grass class]) {
        
        return YES;
    }
    
//    NSLog(@"%@", [firstLivingBeing class]);
//    NSLog(@"%@", [secondLivingBeing class]);
    
    return NO;
}

@end
















