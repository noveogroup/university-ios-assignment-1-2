//
//  Life.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//
//
// Живое существо
//

#import <Foundation/Foundation.h>
#import "ForestEntity.h"

@interface Life : ForestEntity
//имя
@property (readonly) NSString *name;

-(instancetype)initWithName:(NSString *)name
                andCalories:(int)calories;

@end
