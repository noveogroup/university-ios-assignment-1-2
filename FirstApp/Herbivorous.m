//
//  Herbivorous.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Herbivorous.h"
#import "Grass.h"
#import "Forest.h"
#import "Garbage.h"

@interface Herbivorous ()
@property (nonatomic) NSString *name;
@property (nonatomic) double calories;
@property (nonatomic) NSMutableArray *stomach;
@end

@implementation Herbivorous

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with calories: %.1f", self.name, self.calories];
}

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _name = name;
        _stomach = [[NSMutableArray alloc]init];
        _calories = 50;
    }
    return self;
}

-(BOOL)isHide{
    return (BOOL)arc4random()%2;
}

@end
