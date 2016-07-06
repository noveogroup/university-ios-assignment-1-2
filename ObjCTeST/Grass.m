//
//  Grass.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Grass.h"

@interface Grass ()

//@property (nonatomic, copy) NSString *name;
//@property (nonatomic) float calories;

@end

@implementation Grass

//@synthesize name;
//@synthesize calories;

- (instancetype)initWithName:(NSString *)theName {
    
    if (self = [super initWithName:theName]) {
        
        _calories = 10;
    }
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Grass %@ with calories: %f", self.name, self.calories];
}

@end















