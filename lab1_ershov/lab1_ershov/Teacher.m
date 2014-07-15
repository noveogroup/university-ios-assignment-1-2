//
//  Teacher.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Teacher.h"
#import "Student.h"

@implementation Teacher

-(id)init {
    self.students = [[NSMutableArray alloc] init];
    return self;
}

-(void)addStudent:(Student *)student {
    [self.students addObject:student];
}

- (double)getAverageMark {
    double summaryMark = 0;

    for (Student *student in _students) {
        summaryMark += [student getAverageMark];
    }

    return summaryMark / [_students count];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithString:@"Teacher:\n"];

    [description appendFormat:@"\tName: %@\n", self.name];
    [description appendFormat:@"\tAge: %ld\n", self.getAge];
    [description appendFormat:@"\tSalary: %lf\n", _salary];

    [description appendString:@"\tTeaches students:\n"];

    for (int i = 0; i < [_students count]; ++i) {
        [description appendFormat:@"\t%d. %@\n", i+1, [[_students objectAtIndex:(NSUInteger) i] name]];
    }

    return description;
}


@end
