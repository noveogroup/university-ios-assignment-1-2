//
//  Teacher.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Teacher.h"
#import "Group.h"
#import "Department.h"
#import "Student.h"
#import "HeadOfDepartment.h"

@interface Teacher ()

@property (nonatomic, strong) NSMutableArray *tGroups;

@end

@implementation Teacher

- (instancetype)initTeacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andSalary:(NSNumber *) sal
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    if (self != nil)
    {
        _salary=sal;
        _tGroups = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addGroup:(Group *)group
{

    [self.tGroups addObject:group];
    [group addTeacher:self];
}

- (NSArray *)superiors
{
    if (_departmentOfWork.headOfDepartment != nil)
    {
        return @[self.departmentOfWork.headOfDepartment];
    }
    else
    {
        return nil;
    }
}

- (NSArray *)inferiors
{
    NSMutableArray *inferiors = [[NSMutableArray alloc]init];
    for (Group *group in self.groups)
    {
        for (Student *student in group.students)
        {
            [inferiors addObject:student];
        }
    }
    return inferiors;
}

- (NSArray *)groups
{
    return self.tGroups;
}

- (NSString *)description
{
    NSMutableString *stringOfStudents = [NSMutableString stringWithString:@""];
    for (Group *group in self.groups)
    {
        for (Student *student in group.students)
        {
            [stringOfStudents appendFormat:@"%@ %@;", student.firstName, student.lastName];
        }

    }
    return [NSString stringWithFormat:@"{Teacher}: %@, salary: %@, Superior: %@ %@, students: %@", [super description], self.salary, self.departmentOfWork.headOfDepartment.firstName, self.departmentOfWork.headOfDepartment.lastName, stringOfStudents];
}

@end
