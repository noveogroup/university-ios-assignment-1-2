//
//  Teacher.h
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Person.h"
#import "MemberOfEducationProcess.h"
@class Department;
@class Group;

@interface Teacher : Person <MemberOfEducationProcess>

@property (nonatomic, strong) NSNumber *salary;
@property (nonatomic, strong, readonly) NSArray *groups;
@property (nonatomic, weak) Department *departmentOfWork;

@property (nonatomic, strong, readonly) NSArray * superiors;
@property (nonatomic, strong, readonly) NSArray * inferiors;

- (instancetype)initTeacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andSalary:(NSNumber *) sal;
- (void)addGroup:(Group *)group;  //Также добовляет себя в список учителей группы

@end
