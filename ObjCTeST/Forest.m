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
#import "LivingBeing.h"
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
        
        self.livingBeings = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)simulateDay {
    
    while (![RulesOfLife isEnd]) {
        
        u_int32_t i1 = arc4random() % [self.livingBeings count];
        u_int32_t i2 = arc4random() % [self.livingBeings count];
        
        if ([RulesOfLife can:self.livingBeings[i1]
                         eat:self.livingBeings[i2]]) {
            
            id <Animal> eater = self.livingBeings[i1];
            
            NSLog(@"%@ ate %@", self.livingBeings[i1], self.livingBeings[i2]);
            
            [eater eat:self.livingBeings[i2]];
        }
    }
}

@end















