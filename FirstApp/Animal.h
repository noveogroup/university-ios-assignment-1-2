//
//  Animal.h
//  FirstApp
//
//  Created by Admin on 07.07.16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calorific.h"
#import "Forest.h"

@interface Animal : NSObject

-(void)eat:(id<Calorific>)food WithCalories:(double)calories;

-(void)printStomach;

@end
