//
//  Forest.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Forest.h"
#import "RulesOfLife.h"
#import "Animal.h"
#import "Predator.h"
#import "Herbivorous.h"

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
    
    while (![RulesOfLife isEnd]) {
        
        u_int32_t i1 = arc4random() % [self.objects count];
        u_int32_t i2 = arc4random() % [self.objects count];
        float cal;
        
        if ([RulesOfLife can:self.objects[i1]
                         eat:self.objects[i2] withCalories:&cal]) {
            
            Animal *eater = self.objects[i1];
            
            NSLog(@"%@ ate %@", self.objects[i1], self.objects[i2]);
            
            [eater eat:self.objects[i2] calories:cal];
        }
    }
}

@end















