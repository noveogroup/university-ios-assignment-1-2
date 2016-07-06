//
//  RulesOfLife.h
//  FirstApp
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RulesOfLife : NSObject

//кто ест
@property id eateth;
//кого едят
@property id eater;
//процент калорий, если съел
@property double percentageOfCalories;
//массив правил
@property NSMutableArray *rules;

+ (RulesOfLife *)sharedInstance;

- (void)addNewRuleWithEateth:(Class)eateth
                    andEater:(Class)eater
     andPercentageOfCalories:(double)percentageOfCalories;
@end
