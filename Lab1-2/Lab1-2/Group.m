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
    if (self != nil)
    {
        _name = name;
        _gStudents = [[NSMutableArray alloc] init];
        _gTeachers = [[NSMutableArray alloc] init];
        _observers = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addStudent:(Student *) student
{
    [self.gStudents addObject:student];
    student.group = self;
    [student addObserver:self];
    [self recalculateAveragePoint:self];
}

- (void)addTeacher:(Teacher *) teacher
{

    [self.gTeachers addObject:teacher];
}

- (void)recalculateAveragePoint:(id<Observable>)observer
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

- (NSArray *)students
{
    return self.gStudents;
}

- (NSArray *)teachers
{
    return self.gTeachers;
}

@end
