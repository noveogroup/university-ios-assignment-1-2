//
//  Predator.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//
//
//Хищник
//

#import <Foundation/Foundation.h>
#import "Life.h"
#import "Animal.h"

@interface Predator : Life <Animal>
@property int weight;
@property NSMutableArray *stomach;

//Защищается от другого хищника
- (BOOL)isProtect;
- (instancetype)initWithWeight:(int)weight andName:(NSString *)name;

@end
