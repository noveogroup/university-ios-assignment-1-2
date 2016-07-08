//
//  Grass.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Named.h"
#import "RulesOfLife.h"

@interface Grass : NSObject <Calories, Named, RulesOfLife>

- (instancetype)initWithName:(NSString *)name;
- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal;

@end
