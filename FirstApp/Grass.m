//
//  Grass.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Grass.h"

static const double kDefaultGrassCalories = 10;

@implementation Grass

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with calories: %.1f", self.name, self.calorific];
}

-(double)calorific{
    return kDefaultGrassCalories;
}

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _name = name;
    }
    return self;
}

@end
