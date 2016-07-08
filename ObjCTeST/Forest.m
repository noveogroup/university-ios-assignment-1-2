//
//  Forest.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Forest.h"
#import "Predator.h"
#import "Herbivorous.h"
#import "Garbage.h"

@implementation Forest

+ (instancetype)sharedForest {
    
    static Forest *forest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        forest = [[Forest alloc] init];
    });
    return forest;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.objects = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)simulateDay {
    
    while (![self isEnd]) {
        
        u_int32_t i1 = arc4random() % [self.objects count];
        u_int32_t i2 = arc4random() % [self.objects count];
        float cal;
        
        if ([self.objects[i1] respondsToSelector:@selector(canEat:withCalories:)]) {
            
            if ([self.objects[i1] canEat:self.objects[i2] withCalories:&cal]) {
                
                NSLog(@"%@ ate %@", self.objects[i1], self.objects[i2]);
                [self.objects[i1] eat:self.objects[i2] calories:cal];
                [self.objects removeObject:self.objects[i2]];
            }
        }
    }
}

- (BOOL)isEnd {
    
    int npredators = 0;
    int nherbivorouses = 0;
    int ngarbage = 0;
    
    for (id <Calories> object in self.objects) {
        
        if ([object isKindOfClass:[Predator class]]) {
            
            npredators++;
        }
        else if ([object isKindOfClass:[Herbivorous class]]) {
            
            nherbivorouses++;
        }
        else if ([object isKindOfClass:[Garbage class]]) {
            
            ngarbage++;
        }
    }
    
    if (npredators == 1 && nherbivorouses == 0 && ngarbage == 0) {
        
        return YES;
    }
    
    return NO;
}

@end















