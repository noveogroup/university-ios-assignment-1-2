//
//  Student.h
//  Lab1
//
//  Created by Admin on 14/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef Lab1_Student_h
#define Lab1_Student_h

#import "Human.h"
#import "StudentAvgObserver.h"
#import "StudentGradeBook.h"
#import "EducationMember.h"

@interface Student : Human <EducationMember>

@property (nonatomic, assign) float avgGrade;

-(void) addAvgObserver:(id<StudentAvgObserver>) observer;

-(void) addNewGrade:(NSNumber*) grade
            subject:(Subject) subject;

@end


#endif
