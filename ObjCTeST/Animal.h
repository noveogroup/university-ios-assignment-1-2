//
//  Animal.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LivingBeing.h"

@protocol Animal <NSObject>

@property NSMutableArray *stomach;

- (void)eat:(LivingBeing *)livingBeing;

@end
