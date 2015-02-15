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

@implementation Teacher

- (instancetype)initTeacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andSalary:(NSNumber *) sal
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    self.salary=sal;
    return self;
}

- (void)addGroup:(Group *)group
{
    if (self.groupsList == nil)
    {
        _groupsList = [[NSMutableArray alloc] init];
    }
    
    [self.groupsList addObject:group];
    [group addTeacher:self];
}

- (NSArray *)getSuperiors
{
    NSMutableArray *superior = [[NSMutableArray alloc]init];
    [superior addObject:_departmentOfWork.headOfDepartment];
    return superior;
}

- (NSArray *)getInferiors
{
    NSMutableArray *inferiors = [[NSMutableArray alloc]init];
    for (Group *group in self.groupsList)
    {
        for (Student *student in group.studentList)
        {
            [inferiors addObject:student];
        }
    }
    return inferiors;
}

@end
