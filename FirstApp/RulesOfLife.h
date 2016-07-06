//
//  RulesOfLife.h
//  FirstApp
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Life.h"

@interface RulesOfLife : NSObject

+ (BOOL)canEatFirst:(Life *)first
          andSecond:(Life *)second;

@end
