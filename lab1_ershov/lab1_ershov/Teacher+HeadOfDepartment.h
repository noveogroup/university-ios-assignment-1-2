//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

@interface Teacher (HeadOfDepartment)

@property (nonatomic, readonly) NSArray *subordinates;

- (void)addSubordinate:(Teacher *)subordinate;

@end