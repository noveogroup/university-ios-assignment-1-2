//
//  RulesOfLife.h
//  FirstApp
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calorific.h"

@interface RulesOfLife : NSObject

+ (BOOL)canEatFirst:(id<Calorific>)first
          andSecond:(id<Calorific>)second
     andGetCalories:(double *)calories;

@end
