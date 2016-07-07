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

@interface Predator ()
@property (nonatomic) NSString *name;
@property (nonatomic) double calories;
@property (nonatomic) NSMutableArray *stomach;
@property (nonatomic) int weight;
@end

@implementation Predator

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with weight: %d and calories: %.1f", self.name, self.weight, self.calories];
}

- (instancetype)initWithWeight:(int)weight andName:(NSString *)name{
    self = [super init];
    if(self){
        _weight = weight;
        _stomach = [[NSMutableArray alloc]init];
        _name = name;
        _calories = 100;
    }
    return self;
}

- (BOOL)isProtect{
    return (BOOL)arc4random()%2;
}

@end
