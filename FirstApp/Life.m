//
//  Life.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Life.h"

@implementation Life

-(instancetype)initWithName:(NSString *)name
                andCalories:(int)calories{
    self = [super init];
    if(self){
        _name = name;
        _calories = calories;
    }
    return self;
}

@end
