//
//  LivingBeing.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Calories.h"

@interface LivingBeing : NSObject

@property (nonatomic, readonly, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end







