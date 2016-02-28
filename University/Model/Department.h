//
//  Department.h
//  University
//
//  Created by Oleg Sannikov on 2/21/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UniversityEmployee, DepartmentChief, Teacher;

@interface Department : NSObject
- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;
+ (instancetype)departmentWithName:(NSString *)name;

@property (copy, nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) float meanGrade;
@property (nonatomic) DepartmentChief *chief;
@property (nonatomic, readonly) NSSet<UniversityEmployee *> *employees;
@property (nonatomic, readonly) NSSet<Teacher *> *teachers;

- (void)addEmployee:(UniversityEmployee *)employee;
- (void)addEmployees:(NSArray<UniversityEmployee *> *)employees;

@end
