//
//  Grass.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Grass.h"

@interface Grass ()

@property NSString *name;
@property float calories;

@end

@implementation Grass

@synthesize name;
@synthesize calories;

- (instancetype)init {
    
    self = [self initWithName:[NSString stringWithFormat:
                               @"Grass %@", [NSDate date]]];
    return self;
}

- (instancetype)initWithName:(NSString *)theName {
    
    if (self = [super initWithName:theName]) {
        
        self.calories = 10;
    }
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:
            @"Grass %@ with calories: %f", self.name, self.calories];
}

@end
