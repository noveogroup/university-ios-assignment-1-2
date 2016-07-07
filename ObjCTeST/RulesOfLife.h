//
//  EatingRules.h
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "ForestObject.h"

@interface RulesOfLife : NSObject

+ (BOOL)can:(ForestObject *)first eat:(ForestObject *)second withCalories:(float *)cal;
+ (BOOL)isEnd;

@end
