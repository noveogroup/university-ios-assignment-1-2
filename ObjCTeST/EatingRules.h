//
//  EatingRules.h
//  ForestLife
//
//  Created by Vladislav Librecht on 06.07.16.
//  Copyright (c) 2016 Vladislav Librecht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LivingBeing.h"

@interface EatingRules : NSObject

+ (BOOL)can:(LivingBeing *)firstLivingBeing eat:(LivingBeing *)secondLivingBeing;

@end
