//
//  University.h
//  Lab1-2
//
//  Created by Александр on 17.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Department;

@interface University : NSObject

@property (nonatomic, strong, readonly) NSArray *departments;
@property (nonatomic, strong, readonly) NSArray *students;
@property (nonatomic, strong, readonly) NSArray *teachers;
@property (nonatomic, strong, readonly) NSArray *headsOfDepartments;



+ (instancetype)sharedInstance;

- (void)addDepartment:(Department *)department;

@end
