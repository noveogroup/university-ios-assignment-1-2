//
//  University.m
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "University.h"
#import "Rector.h"
#import "Dean.h"
#import "DepartmentHead.h"
#import "Teacher.h"
#import "Student.h"
#import "EmployeeData.h"



@implementation University

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subordinates = [NSArray array];
    }
    return self;
}


- (void)addSubordinate:(id<UniversityEmployee>)aSub {
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:aSub];
    self.subordinates = [self.subordinates arrayByAddingObjectsFromArray:[tempArray copy]];
}

- (void)getSubordinatesList {
    NSLog(@"%@", self);
    if ([self.subordinates count] != 0) {
        for (id <UniversityEmployee> object in self.subordinates) {
            [object getSubordinatesList];
        }
    }
}

- (void)generateUniversityEmployees {
    
    Rector *rector = [[Rector alloc] init];
    [self addSubordinate:rector];
    
    NSInteger numberOfDean = 2;
    NSInteger numberOfDepHead = 3;
    NSInteger numberOfTeacher = 4;
    NSInteger numberOfStudent = 5;
    
    for (int i = 0; i < numberOfDean; i++) {
        Dean *dean = [[Dean alloc] init];
        [rector addSubordinate:dean];
        [self addSubordinate:dean];
        
        for (int j = 0; j < numberOfDepHead; j++) {
            DepartmentHead *dHead = [[DepartmentHead alloc] init];
            [dean addSubordinate:dHead];
            [self addSubordinate:dHead];
            
            for (int k = 0; k < numberOfTeacher; k++) {
                Teacher *teacher = [[Teacher alloc] init];
                [dHead addSubordinate:teacher];
                [self addSubordinate:teacher];
                
                for (int l = 0; l < numberOfStudent; l++) {
                    Student *stud = [[Student alloc] init];
                    [teacher addSubordinate:stud];
                    [self addSubordinate:stud];
                }
            }
        }
    }
}

- (NSArray *)getStudentsOfDepartmentFromStudent:(Student *)student {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    id<UniversityEmployee> teacher = student.boss;
    
    for (Student *student in teacher.subordinates) {
        [tempArray addObject:student];
    }
    
    id<UniversityEmployee> dHead = teacher.boss;
    
    for (id<UniversityEmployee> object in dHead.subordinates) {
        if (![object isEqual:teacher]) {
            for (Student *student in object.subordinates) {
                [tempArray addObject:student];
            }
        }
    }
    return [tempArray copy];
}

- (float)getOverallGPAOfDepartmentWithBoss:(id<UniversityEmployee>)dHead {
    NSInteger count = 0;
    float value = 0.f;
    
    for (id<UniversityEmployee> object in dHead.subordinates) {
        for (Student *student in object.subordinates) {
            value += student.GPA;
            count++;
        }
    }
    
    float overallGPA = value / count;
    return overallGPA;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"University:"];
}



@end
