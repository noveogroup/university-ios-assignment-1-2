//
//  Predator.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Predator.h"
#import "Herbivorous.h"
#import "Garbage.h"

const NSInteger kPredatorDefaultCalories = 100;

@interface Predator ()

@property (nonatomic) float weight;

@end

@implementation Predator

- (instancetype)initWithName:(NSString *)name andWeight:(float)weight {
    
    if (self = [super initWithName:name andCalories:kPredatorDefaultCalories]) {

        _weight = weight;
    }
    
    return self;
}

- (BOOL) isDefending {
    
    return arc4random() % 2 == 0;
}

- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal {
    
    if ([object isKindOfClass:[Predator class]]) {
        
        Predator *pr = (Predator *)object;
        
        if (self.weight > pr.weight && ![pr isDefending] && self != pr) {
            
            *cal = pr.calories / 2;
            return YES;
        }
        
    } else if ([object isKindOfClass:[Herbivorous class]]) {
        
        Herbivorous *h = (Herbivorous *)object;
        
        if (![h isHiding]) {
            
            *cal = h.calories / 2;
            return YES;
        }
        
    } else if ([object isKindOfClass:[Garbage class]]) {
        
        *cal = object.calories;
        return YES;
    }
    
    return NO;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Predator %@ with weight: %g, calories: %g", self.name, self.weight, self.calories];
}

@end



















