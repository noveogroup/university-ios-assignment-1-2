//
//  ForestEntity.m
//  FirstApp
//
//  Created by Admin on 06.07.16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "ForestEntity.h"

@implementation ForestEntity

-(instancetype)initWithCalories:(int)calories{
    self = [super init];
    if(self){
        _calories = calories;
    }
    return self;
}

@end
