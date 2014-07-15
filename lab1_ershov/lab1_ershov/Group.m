//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Group.h"
#import "Student.h"


@implementation Group

- (double)getAverageMark {
    double summaryMark = 0;

    for (Student *student in _students) {
        summaryMark += [student getAverageMark];
    }

    return summaryMark / [_students count];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"Group \"%@\":\r", _name];

    [description appendFormat:@"\tAverage mark: %lf\r", self.getAverageMark];

    [description appendString:@"\tStudents:\r"];

    for (int i = 0; i < [_students count]; ++i) {
        [description appendFormat:@"\t%d. %@\r", i, [_students objectAtIndex:(NSUInteger) i]];
    }

    return description;
}

@end