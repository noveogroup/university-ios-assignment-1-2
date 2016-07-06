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

+ (BOOL)canEatFirst:(Life *)first
          andSecond:(Life *)second{
    if ([first isKindOfClass:[Grass class]]) {
        return NO;
    } else if ([first isKindOfClass:[Herbivorous class]]){
        if ([second isKindOfClass:[Grass class]] || [second isKindOfClass:[Garbage class]] ) {
            return YES;
        }
    } else if ([first isKindOfClass:[Predator class]]){
        if ([second isKindOfClass:[Herbivorous class]]) {
            if ([second respondsToSelector:@selector(isHide)]) {
                if ([second performSelector:@selector(isHide)]) {
                    return YES;
                }
            }
        } else if ([second isKindOfClass:[Predator class]]){
            if(((Predator*)first).weight > ((Predator*)second).weight && !((Predator*)second).isProtect){
                return YES;
            }
        } else if ([second isKindOfClass:[Garbage class]]){
            return YES;
        }

    }
    return NO;
}

@end
