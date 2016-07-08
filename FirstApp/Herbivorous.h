//
//  Herbivorous.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//
//
//Травоядное
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Calorific.h"

@interface Herbivorous : Animal

-(instancetype)initWithName:(NSString *)name;

//прячется от хищника
- (BOOL)isHide;

@end
