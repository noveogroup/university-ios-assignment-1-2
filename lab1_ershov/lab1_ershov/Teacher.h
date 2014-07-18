//
//  Teacher.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"
#import "Human.h"

@class Student;

@interface Teacher : Human

@property (nonatomic) double salary;
@property (nonatomic, readonly, copy) NSArray *students;

-(void)addStudent:(Student *)student;

@end
