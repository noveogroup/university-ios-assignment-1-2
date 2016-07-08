//
//  Garbage.h
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Calories.h"
#import "RulesOfLife.h"

@interface Garbage : NSObject <Calories, RulesOfLife>

- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal;

@end
