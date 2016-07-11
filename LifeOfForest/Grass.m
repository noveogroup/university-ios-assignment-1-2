//
//  Grass.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Grass.h"

const NSInteger grassCalories = 10;


@implementation Grass

- (instancetype)init
{
    self = [self initWithName:[NSString stringWithFormat:@"Grass%i", arc4random()%1000]];
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self){
        _name = [name copy];
    }
    return self;
}

- (NSInteger)calories
{
    return grassCalories;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"%@", self.name];
}

@end
