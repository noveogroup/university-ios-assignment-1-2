//
//  Herbivorous.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"
#import "Grass.h"

@interface Herbivorous : LivingBeing <Animal>

- (instancetype)initWithName:(NSString *)name;
- (BOOL) isHiding;

@end
