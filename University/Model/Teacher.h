//
//  Teacher.h
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "UniversityEmployee.h"

@class Course, Student;

@interface Teacher : UniversityEmployee
@property (nonatomic, readonly) NSSet<Course *> *courses;
@property (nonatomic, readonly) NSSet<Student *> *students;
@property (nonatomic, readonly) float meanGrade;

- (Course *)startCourseWithName:(NSString *)name;

@end
