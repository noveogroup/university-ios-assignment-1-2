//
//  Animal.h
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Calories.h"
#import "RulesOfLife.h"

@interface Animal <Calories, Named> : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) float calories;
@property (nonatomic, readonly) NSMutableArray *stomach;

- (instancetype)initWithName:(NSString *)name andCalories:(float)cal;
- (void)eat:(id <Calories>)object calories:(float)cal;
- (void)printStomachWith:(NSString *)tab;

@end
