//
//  Predator.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"
#import "Named.h"

@interface Predator <RulesOfLife> : Animal

@property (nonatomic, readonly) float weight;

- (instancetype)initWithName:(NSString *)name andWeight:(float)weight;
- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal;
- (BOOL) isDefending;

@end
