//
//  Herbivore.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Herbivore.h"

@implementation Herbivore

- (instancetype)init
{
    NSString *str = [NSString stringWithFormat:@"Herbivore%i", arc4random()%1000];
    self = [super initWithName:str calories:50];
    return self;
}

- (BOOL)isHide
{
    return arc4random()%2 == 0;
}

@end
