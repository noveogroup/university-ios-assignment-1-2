//
//  LivingBeing.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LivingBeing : NSObject

@property (readonly) NSString *name;
@property (readonly) float calories;

- (instancetype)initWithName:(NSString *)name andCalories:(float)cal;

@end
