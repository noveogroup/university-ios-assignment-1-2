//
//  Teacher.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Teacher.h"
#import "Student.h"

@interface Teacher ()

@property NSMutableArray *mStudents;

@end

@implementation Teacher

-(instancetype)init {
    self.mStudents = [[NSMutableArray alloc] init];
    return self;
}

-(void)addStudent:(Student *)student {
    [self.mStudents addObject:student];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithString:@"Teacher:\n"];

    [description appendFormat:@"\tName: %@\n", self.name];
    [description appendFormat:@"\tAge: %ld\n", [self getAge]];
    [description appendFormat:@"\tSalary: %lf\n", self.salary];

    [description appendString:@"\tTeaches students:\n"];

    int i = 0;
    for (Student *student in self.students) {
        [description appendFormat:@"\t%d. %@\n", i+1, student.name];
        i++;
    }

    return description;
}


@end
