//
//  HeadOfDepartment.m
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "HeadOfDepartment.h"
#import "Department.h"
#import "Group.h"
#import "Teacher.h"

@implementation HeadOfDepartment

- (NSArray *)superiors
{
    return nil;
}

- (NSArray *)inferiors
{
    return self.departmentOfWork.teachers;
}

- (NSString *)description
{
    NSString *person = [NSString stringWithFormat:@"Firsr name: %@, Last name: %@, age: %@", self.firstName, self.lastName, self.age];
    NSMutableString *stringsOfInferiors = [NSMutableString stringWithString:@""];
    for (Group *group in self.departmentOfWork.groups)
    {
        for (Teacher *teacher in group.teachers)
        {
            [stringsOfInferiors appendFormat:@"%@ %@;", teacher.firstName, teacher.lastName];
        }
        
    }
    return [NSString stringWithFormat:@"{Head of Department}: %@, salary: %@, inferiors: %@", person, self.salary, stringsOfInferiors];
}

@end
