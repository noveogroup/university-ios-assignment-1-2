//
//  Grass.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Grass.h"

const NSInteger kGrassDefaultCalories = 10;

@interface Grass ()

@property (nonatomic) NSString *name;

@end

@implementation Grass

- (instancetype)initWithName:(NSString *)name
{
    
    if (self = [super init]) {
        
        _name = name;
    }
    
    return self;
}

- (float)calories
{
    
    return kGrassDefaultCalories;
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"Grass %@ with calories: %g", self.name, self.calories];
}

@end















