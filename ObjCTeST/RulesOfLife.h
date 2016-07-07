//
//  EatingRules.h
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "Calories.h"

@interface RulesOfLife : NSObject

+ (BOOL)can:(id <Calories>)first eat:(id <Calories>)second withCalories:(float *)cal;
+ (BOOL)isEnd;

@end
