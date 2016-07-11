//
//  Herbivore.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Herbivore.h"

const NSInteger kHerbivoreCalories = 50;

@implementation Herbivore

- (instancetype)init
{
    self = [self initWithName:[NSString stringWithFormat:@"Herbivore%i", arc4random()%1000]];
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super initWithName:name calories:kHerbivoreCalories];
    return self;
}

- (instancetype)initWithName:(NSString *)name calories:(NSInteger)calories
{
    self = [self initWithName:name];
    return self;
}

- (BOOL)isHide
{
    return arc4random()%2 == 0;
}

@end
