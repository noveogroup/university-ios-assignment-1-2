//
//  HeadOfDepartment.h
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"

@class Student;
@class Teacher;
@class  Faculty;

@interface HeadOfDepartment : Human

// @property (weak) Faculty *faculty;
// @property double salary;

- (void)description;
- (NSArray *)students;
- (NSArray *)teachers;
- (void)addTeacher:(Teacher *)teacher;
- (void)addStudent:(Student *)student;

@end
