//
//  Grass.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Grass.h"

@interface Grass ()

@property (nonatomic) NSString *name;

@end

@implementation Grass

- (instancetype)initWithName:(NSString *)aName {
    
    if (self = [super init]) {
        
        _name = aName;
    }
    
    return self;
}

- (float)calories {
    
    return 10;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Grass %@ with calories: %f", self.name, self.calories];
}

@end















