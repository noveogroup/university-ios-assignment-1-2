//
//  Department.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Department.h"
#import "Teacher.h"
#import "Group.h"

@interface Department()

@property (nonatomic, strong) NSMutableArray *dGroups;
@property (nonatomic, strong) NSMutableArray *dTeachers;

@end

@implementation Department

- (Department *)initWithName:(NSString*)name
{
    self = [self init];
    _name = name;
    return self;
}

- (void)addGroup:(Group *)group
{
    if (self.groups == nil)
    {
        _groups = [[NSMutableArray alloc] init];
    }
    
    [self.dGroups addObject:group];
    [group addObserverForGroup:self];
    [self recalculateAveragePoint];
}

- (void)addTeacher:(Teacher *) teacher
{
    if (self.teachers == nil)
    {
        _teachers = [[NSMutableArray alloc] init];
    }
    [self.dTeachers addObject:teacher];
    teacher.departmentOfWork = self;
}

- (void)addHeadOfDepartment:(HeadOfDepartment *) head
{
    _headOfDepartment = head;
}

- (void)recalculateAveragePoint
{
    double sum = 0.0;
    for (Group *group in self.groups)
    {
        sum += [group.groupAveragePoint doubleValue];
    }
    self.departmentAveragePoint = @(sum / [self.groups count]);
}

- (NSArray *)groups
{
    return self.dGroups;
}

- (NSArray *)teachers
{
    return self.dTeachers;
}
@end
