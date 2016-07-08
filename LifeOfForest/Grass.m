//
//  Grass.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Grass.h"


@implementation Grass

- (NSInteger)calories
{
    return 10;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = [NSString stringWithFormat:@"Grass%i", arc4random()%1000];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self){
        _name = name;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"%@", self.name];
}

@end
