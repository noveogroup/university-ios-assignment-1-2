//
//  Group.m
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Group.h"
#import "Student.h"

@interface Group ()

@property (nonatomic, strong) NSMutableArray *observers;

@property (nonatomic, strong) NSMutableArray *gStudents;
@property (nonatomic, strong) NSMutableArray *gTeachers;

@end


@implementation Group

- (Group *)initWithName:(NSString*)name
{
    self = [self init];
    _name = name;
    return self;
}

- (void)addStudent:(Student *) student
{
    if (self.students == nil)
    {
        _students = [[NSMutableArray alloc] init];
    }
    [self.gStudents addObject:student];
    student.group = self;
    [student addObserverForStudent:self];
    [self recalculateAveragePoint];
}

- (void)addTeacher:(Teacher *) teacher
{
    if (self.teachers == nil)
    {
        _teachers = [[NSMutableArray alloc] init];
    }
    [self.gTeachers addObject:teacher];
}

- (void)recalculateAveragePoint
{
    if (self.students == nil)
    {
        _groupAveragePoint = nil;
    }
    else
    {
        double sum = 0.0;
        for (Student *student in self.students)
        {
            sum += [student.averagePoint doubleValue];
        }
        self.groupAveragePoint = @(sum / [self.students count]);
    }
    [self notifyObservers];
}

- (void)addObserverForGroup:(id<AveragePointObserver>) observer
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

- (NSArray *)students
{
    return self.gStudents;
}

- (NSArray *)teachers
{
    return self.gTeachers;
}

@end
