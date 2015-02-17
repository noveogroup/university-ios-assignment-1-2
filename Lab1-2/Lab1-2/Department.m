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
#import "HeadOfDepartment.h"

@interface Department()

@property (nonatomic, strong) NSMutableArray *dGroups;
@property (nonatomic, strong) NSMutableArray *dTeachers;

@property (nonatomic, strong) NSMutableArray *observers;

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
    if (self.dGroups == nil)
    {
        _dGroups = [[NSMutableArray alloc] init];
    }
    
    [self.dGroups addObject:group];
    [group addObserverForGroup:self];
    [self recalculateAveragePoint];
}

- (void)addTeacher:(Teacher *) teacher
{
    if (self.dTeachers == nil)
    {
        _dTeachers = [[NSMutableArray alloc] init];
    }
    [self.dTeachers addObject:teacher];
    teacher.departmentOfWork = self;
}

- (void)addHeadOfDepartment:(HeadOfDepartment *) head
{
    _headOfDepartment = head;
    head.departmentOfWork = self;
}

- (void)recalculateAveragePoint
{
    double sum = 0.0;
    for (Group *group in self.groups)
    {
        sum += [group.groupAveragePoint doubleValue];
    }
    self.departmentAveragePoint = @(sum / [self.groups count]);
    [self notifyObservers];
}

- (NSArray *)groups
{
    return self.dGroups;
}

- (NSArray *)teachers
{
    return self.dTeachers;
}

- (void)addObserverForDepartment:(id<AveragePointObserver>) observer
{
    if (self.observers == nil)
    {
        self.observers = [[NSMutableArray alloc]init];
    }
    [self.observers addObject:observer];
}

-(void)notifyObservers
{
    for (id<AveragePointObserver> observer in self.observers)
    {
        [observer recalculateAveragePoint];
    }
}

@end
