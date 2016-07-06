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

@implementation RulesOfLife

+ (RulesOfLife *)sharedInstance{
    static dispatch_once_t once;
    static RulesOfLife *sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if(self){
        self.rules = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addNewRuleWithEateth:(Class)eateth
              andEater:(Class)eater
andPercentageOfCalories:(double)percentageOfCalories{
    
    
}



@end
