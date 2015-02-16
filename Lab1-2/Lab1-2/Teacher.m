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

@interface Teacher ()

@property (nonatomic, strong) NSMutableArray *tGroups;

@end

@implementation Teacher

- (instancetype)initTeacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andSalary:(NSNumber *) sal
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    self.salary=sal;
    return self;
}

- (void)addGroup:(Group *)group
{
    if (self.groups == nil)
    {
        _groups = [[NSMutableArray alloc] init];
    }
    
    [self.tGroups addObject:group];
    [group addTeacher:self];
}

- (NSArray *)superiors
{
    NSMutableArray *superior = [[NSMutableArray alloc]init];
    [superior addObject:_departmentOfWork.headOfDepartment];
    return superior;
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

@end
