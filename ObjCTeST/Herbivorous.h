//
//  Herbivorous.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"
#import "Named.h"

@interface Herbivorous : Animal <Calories, Named>

- (BOOL) isHiding;
- (instancetype)initWithName:(NSString *)aName;

@end
