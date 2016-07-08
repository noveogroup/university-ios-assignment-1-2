//
//  EatingRules.h
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import "Calories.h"

@protocol RulesOfEating <NSObject>

@required
- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal;

@end
