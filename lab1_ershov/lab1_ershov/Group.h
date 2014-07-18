//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"
#import "Observable.h"
#import "Observer.h"

@class Student;


@interface Group : NSObject <HasAverageMark, Observable, Observer>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *students;

- (instancetype)initWithName:(NSString *)name;

- (void)addStudent:(Student *)student;

@end