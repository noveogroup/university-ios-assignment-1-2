//
//  DeportamentMember.h
//  Lab1
//
//  Created by Admin on 16/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"
#import "EducationMember.h"

@interface DeportamentMember : Human <EducationMember>

@property (nonatomic, assign) uint *standing;
@property (nonatomic, assign) float salaryRate;

@end
