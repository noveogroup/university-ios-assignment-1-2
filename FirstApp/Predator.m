//
//  Predator.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Predator.h"
#import "Herbivorous.h"
#import "Forest.h"
#import "Garbage.h"

static const double kDefaultPredatorCalories = 100;

@interface Predator ()
@property (nonatomic) int weight;
@end

@implementation Predator

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with weight: %d and calories: %.1f", self.name, self.weight, self.calories];
}

- (instancetype)initWithWeight:(int)weight andName:(NSString *)name{
    self = [super initWithName:name andCalories:kDefaultPredatorCalories];
    if(self){
        _weight = weight;
    }
    return self;
}

- (BOOL)isProtect{
    return arc4random()%2 == 0;
}

@end
