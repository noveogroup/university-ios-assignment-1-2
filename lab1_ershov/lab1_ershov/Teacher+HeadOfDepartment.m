//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Teacher+HeadOfDepartment.h"
#import "Student.h"

@interface Teacher ()

@property (nonatomic) NSMutableArray *mSubordinates;

@end

@implementation Teacher (HeadOfDepartment)

- (void)addSubordinate:(Teacher *)subordinate {
    [self.mSubordinates addObject:subordinate];
}

- (NSArray *)subordinates {
    return self.mSubordinates;
}


- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithString:@"Teacher and Head of Department:\n"];

    [description appendFormat:@"\tName: %@\n", self.name];
    [description appendFormat:@"\tAge: %ld\n", [self getAge]];
    [description appendFormat:@"\tSalary: %lf\n", self.salary];

    [description appendString:@"\tTeaches students:\n"];

    int i = 1;
    for (Student *student in self.students) {
        [description appendFormat:@"\t%d. %@\n", i++, student.name];
    }

    [description appendString:@"\tSuperior of:\n"];

    i = 1;
    for (Teacher *teacher in self.subordinates) {
        [description appendFormat:@"\t%d. %@\n", i++, teacher.name];
    }

    return description;
}


@end