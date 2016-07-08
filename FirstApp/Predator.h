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
#import "Animal.h"
#import "Calorific.h"

@interface Predator : Animal
@property (nonatomic, readonly) int weight;

//Защищается от другого хищника
- (BOOL)isProtect;
- (instancetype)initWithWeight:(int)weight andName:(NSString *)name;

@end
