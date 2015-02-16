//
//  Group.h
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AveragePointObserver.h"
@class Student;
@class Teacher;
@class Department;
@interface Group : NSObject <AveragePointObserver>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *groupAveragePoint;
@property (nonatomic, strong) NSArray *students;
@property (nonatomic) NSArray *teachers;


- (Group *)initWithName:(NSString*)name;
- (void)addStudent:(Student *) student;
- (void)addTeacher:(Teacher *) teacher;
- (void)addObserverForGroup:(id<AveragePointObserver>) observer;

@end
