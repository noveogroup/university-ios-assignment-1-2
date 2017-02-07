//
//  Teacher.m
//  Lab1
//
//  Created by Admin on 15/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

@implementation Teacher

-(NSString*) description{
    
    return [NSString stringWithFormat: @"Teacher : %@, Age : %@, Standing: %@", self.fullname, self.age, self.standing];
    
}
@end
