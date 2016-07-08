//
//  RulesOfLife.m
//  FirstApp
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//
//
// Правила жизни
//

#import "RulesOfLife.h"
#import "Grass.h"
#import "Predator.h"
#import "Herbivorous.h"
#import "Garbage.h"

@implementation RulesOfLife

+ (BOOL)canEatFirst:(id<Calorific>)first
          andSecond:(id<Calorific>)second
     andGetCalories:(double *)calories{
    if([first respondsToSelector:@selector(eat:withCalories:)]){
        if ([first isKindOfClass:[Herbivorous class]]){
            if ([second isKindOfClass:[Grass class]] || [second isKindOfClass:[Garbage class]] ) {
                *calories = second.calories;
                return YES;
            }
        } else if ([first isKindOfClass:[Predator class]]){
            if ([second isKindOfClass:[Herbivorous class]]) {
                if ([second respondsToSelector:@selector(isHide)]) {
                    if ([second performSelector:@selector(isHide)]) {
                        *calories = second.calories/2;
                        return YES;
                    }
                }
            } else if ([second isKindOfClass:[Predator class]]){
                if(((Predator*)first).weight > ((Predator*)second).weight && !((Predator*)second).isProtect){
                    *calories = second.calories;
                    return YES;
                }
            } else if ([second isKindOfClass:[Garbage class]]){
                *calories = second.calories;
                return YES;
            }
        }
    }
    return NO;
}

@end
