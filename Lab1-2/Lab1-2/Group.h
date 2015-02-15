//
//  Group.h
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@class Teacher;

@interface Group : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *groupAveragePoint;
@property (nonatomic, strong) NSArray *studentList;
@property (nonatomic, weak) NSArray *teacherList;

- (Group *)initWithName:(NSString*)name;
- (void)addStudent:(Student *) student;
- (void)addTeacher:(Teacher *) teacher;
- (void)changeGroupAveragePoint;

@end
