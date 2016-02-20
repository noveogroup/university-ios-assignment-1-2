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
#include "EmployeeData.h"



@implementation University

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.eData = [EmployeeData sharedInstance];
        self.eData.delegate = self;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"University:"];
}

- (NSMutableArray *)subordinates {
    if (_subordinates == nil) {
        _subordinates = [[NSMutableArray alloc] init];
    }
    return _subordinates;
}

- (void)addSubordinate:(id<UniversityEmployee>)aSub {
    [self.subordinates addObject:aSub];
}

- (void)getSubordinatesList {
    NSLog(@"%@", [self description]);
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
        
        for (int j = 0; j < numberOfDepHead; j++) {
            DepartmentHead *dHead = [[DepartmentHead alloc] init];
            [dean addSubordinate:dHead];
            
            for (int k = 0; k < numberOfTeacher; k++) {
                Teacher *teacher = [[Teacher alloc] init];
                [dHead addSubordinate:teacher];
                
                for (int l = 0; l < numberOfStudent; l++) {
                    Student *stud = [[Student alloc] init];
                    [teacher addSubordinate:stud];
                }
            }
        }
    }
}

@end
