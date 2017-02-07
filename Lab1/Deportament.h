//
//  Deportament.h
//  Lab1
//
//  Created by Admin on 14/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef Lab1_Deportament_h
#define Lab1_Deportament_h

#import "DeportamentMember.h"
#import "StudentGroup.h"
#import "DeportamentDirector.h"
#import "Teacher.h"

@interface Deportament : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double studentsAvgGrade;

-(void) setDeportamentDirector:(DeportamentMember*) depDirector;
-(void) addGroup:(StudentGroup*) group;
-(void) addTeacher:(DeportamentMember*) teacher;

-(float) getAvgGradeByStudents;

@end

#endif
