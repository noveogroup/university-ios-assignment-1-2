//
//  Predator.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Predator.h"

static const NSInteger kPredatorCalories = 100;

@implementation Predator

- (instancetype)init
{
    NSString *str = [NSString stringWithFormat:@"Predator%i", arc4random()%1000];
    self = [super initWithName:str calories:kPredatorCalories];
    if (self){
        _weight = arc4random_uniform(100) + 1;
    }
    return self;
}

- (BOOL)isProtected
{
    return arc4random()%2 == 0;
}

@end
