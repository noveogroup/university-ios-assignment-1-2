//
//  StudentGroup.m
//  Lab1
//
//  Created by Admin on 16/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "StudentGroup.h"

@interface  StudentGroup()

@property (nonatomic, strong) NSMutableSet *students;

@end

@implementation StudentGroup

-(void) addStudent:(Student *)student{
    
    if (self.students == nil)
        self.students = [[NSMutableSet alloc] init];
    
    [self.students addObject:student];
    [student addAvgObserver:self];
    
}

-(void) reCalcAverage{
    
    double result = 0.0;
   
    if ([self.students count] != 0){
        for (Student *student in self.students){
            result += student.avgGrade;
        }
        result = result / [self.students count];
    }
    self.studentsAvgGrade = result;
}

@end
