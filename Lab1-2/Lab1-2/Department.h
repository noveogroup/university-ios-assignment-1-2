//
//  Department.h
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AveragePointObserver.h"
#import "Observable.h"

@class Teacher;
@class Group;
@class HeadOfDepartment;

@interface Department : NSObject <AveragePointObserver, Observable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSArray *groups;
@property (nonatomic, strong, readonly) NSArray *teachers;
@property (nonatomic, strong) HeadOfDepartment *headOfDepartment;
@property (nonatomic, strong) NSNumber *departmentAveragePoint;

- (Department *)initWithName:(NSString*)name;
- (void)addGroup:(Group *)group;
- (void)addTeacher:(Teacher *)teacher;
- (void)addHeadOfDepartment:(HeadOfDepartment *) head;


@end
