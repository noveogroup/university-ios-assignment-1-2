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

@interface Animal : NSObject <Calorific>
@property (nonatomic, copy) NSString *name;
@property (nonatomic) double calories;

-(instancetype)initWithName:(NSString *)name
                andCalories:(double)calories;

-(void)eat:(id<Calorific>)food withCalories:(double)calories;

-(void)printStomach;

@end
