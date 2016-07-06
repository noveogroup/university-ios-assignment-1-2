//
//  Predator.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"

@interface Predator : LivingBeing <Animal>

@property (readonly) float weight;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name andWeight:(float)weight;
- (BOOL) isDefending;
- (void)eat:(LivingBeing *)livingBeing;

@end
