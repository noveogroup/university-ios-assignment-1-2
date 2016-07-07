//
//  Grass.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Grass.h"


@implementation Grass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = [NSString stringWithFormat:@"Grass%i", arc4random()%1000];
    }
    return self;
}

- (int)giveCalories
{
    return 10;
}

- (NSString*)description
{
    return [NSString stringWithFormat: @"%@", self.name];
}

@end
