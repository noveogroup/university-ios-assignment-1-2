//
// Created by Admin on 16/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Department;


@interface DataController : NSObject

@property (nonatomic, readonly) NSArray *departments;

+ (DataController *) sharedInstance;
- (void)addDepartment:(Department *)department;

@end