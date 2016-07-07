//
//  Animal.h
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LivingBeing.h"

@interface Animal : LivingBeing

- (void)eat:(id <Calories>)object calories:(float)cal;

@end
