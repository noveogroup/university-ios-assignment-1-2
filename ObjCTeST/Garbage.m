//
//  Garbage.m
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Garbage.h"

const NSInteger kGarbageDefaultCalories = -1;

@implementation Garbage

- (float)calories
{
    
    return kGarbageDefaultCalories;
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"Garbage with calories: %g", self.calories];
}

@end
