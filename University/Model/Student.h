//
//  Student.h
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Person.h"
#import "EducationalProcessParticipant.h"

@class Course, Teacher;

@interface Student : Person <EducationalProcessParticipant>
@property (nonatomic) float meanGrade;
@property (nonatomic, readonly) NSSet<Course *> *courses;
@property (nonatomic, readonly) NSSet<Teacher *> *teachers;

- (void)singUpForCourse:(Course *)course;

@end
