//
//  Group.h
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AveragePointObserver.h"
#import "Observable.h"
@class Student;
@class Teacher;
@class Department;
@interface Group : NSObject <AveragePointObserver, Observable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *groupAveragePoint;
@property (nonatomic, strong, readonly) NSArray *students;
@property (nonatomic, strong, readonly) NSArray *teachers;


- (Group *)initWithName:(NSString*)name;
- (void)addStudent:(Student *) student;
- (void)addTeacher:(Teacher *) teacher;


@end
