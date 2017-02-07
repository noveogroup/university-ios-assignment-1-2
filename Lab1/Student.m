//
//  Student.m
//  Lab1
//
//  Created by Admin on 15/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentGroup.h"

@interface Student()

@property (nonatomic, strong) NSMutableSet *avgObservers;
@property (nonatomic, strong) StudentGradeBook *gradeBook;

@end

@implementation Student

-(void) addAvgObserver:(id<StudentAvgObserver>)observer{
    
    if (self.avgObservers == nil)
        self.avgObservers = [[NSMutableSet alloc] init];
    
    [self.avgObservers addObject:observer];
}

-(void) addNewGrade:(NSNumber*)grade subject:(Subject)subject{
    
    if (self.gradeBook == nil)
        self.gradeBook = [[StudentGradeBook alloc] init];
    
    [self.gradeBook addGrade:grade subject:subject];
    self.avgGrade = [self.gradeBook calculateAvgGrade];
    
    if (self.avgObservers != nil && [self.avgObservers count] != 0)
        for(id<StudentAvgObserver> observer in self.avgObservers)
            [observer reCalcAverage];
}

@end
