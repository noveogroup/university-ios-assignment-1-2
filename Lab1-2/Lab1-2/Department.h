//
//  Department.h
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Teacher;
@class Group;
@class HeadOfDepartment;

@interface Department : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSMutableArray *groups;
@property (nonatomic, strong, readonly) NSMutableArray *teachers;
@property (nonatomic) HeadOfDepartment *headOfDepartment;
@property (nonatomic, strong) NSNumber *departmentAveragePoint;

- (Department *)initWithName:(NSString*)name;
- (void)addGroup:(Group *)group;
- (void)addTeacher:(Teacher *)teacher;
- (void)addHeadOfDepartment:(HeadOfDepartment *) head;
- (void)changeDepartmentAveragePoint;
- (NSString *)description;

@end
