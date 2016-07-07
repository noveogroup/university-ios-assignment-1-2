//
//  Predator.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Predator.h"

@interface Predator ()

@property (nonatomic) NSString *name;
@property (nonatomic) float calories;
@property (nonatomic) NSMutableArray *stomach;
@property (nonatomic) float weight;

@end

@implementation Predator

- (instancetype)initWithName:(NSString *)aName andWeight:(float)aWeight {
    
    if (self = [super init]) {
        
        _name = aName;
        _calories = 100;
        _weight = aWeight;
        _stomach = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BOOL) isDefending {
    
    return arc4random() % 2;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Predator %@ with weight: %f, calories: %f and stomach: %@", self.name, self.weight, self.calories, self.stomach.description];
}

@end



















