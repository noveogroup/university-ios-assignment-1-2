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
    if (self != nil)
    {
        _name = name;
        _dGroups = [[NSMutableArray alloc] init];
        _dTeachers = [[NSMutableArray alloc] init];
        _observers = [[NSMutableArray alloc]init];
    }
    
    return self;
}

- (void)addGroup:(Group *)group
{
    
    [self.dGroups addObject:group];
    [group addObserver:self];
    [self recalculateAveragePoint:self];
}

- (void)addTeacher:(Teacher *) teacher
{

    [self.dTeachers addObject:teacher];
    teacher.departmentOfWork = self;
}

- (void)addHeadOfDepartment:(HeadOfDepartment *) head
{
    _headOfDepartment = head;
    head.departmentOfWork = self;
}

- (void)recalculateAveragePoint:(id<Observable>)observer
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

- (void)addObserver:(id<AveragePointObserver>) observer
{

    [self.observers addObject:observer];
}

- (void)removeObserver:(id<AveragePointObserver>) observer
{
    [self.observers removeObject:observer];
}

-(void)notifyObservers
{
    for (id<AveragePointObserver> observer in self.observers)
    {
        [observer recalculateAveragePoint:self];
    }
}

@end
