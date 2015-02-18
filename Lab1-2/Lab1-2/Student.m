//
//  Student.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Student.h"
#import "Group.h"
#import "Teacher.h"

@interface Student ()

@property (nonatomic, strong) NSMutableArray *observers;

@end


@implementation Student

- (instancetype)initStudentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andAveragePoint:(NSNumber *) aPoint
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    if (self != nil)
    {
        _averagePoint=aPoint;
        _observers = [[NSMutableArray alloc]init];

    }
    return self;
}



- (void)setAveragePoint:(NSNumber *)averagePoint
{
    _averagePoint = averagePoint;
    [self notifyObservers];
}

- (NSArray *)inferiors
{
    return nil;
}

- (NSArray *)superiors
{
    return _group.teachers;
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

- (NSString *)description
{
    NSMutableString *stringOfTeachers = [NSMutableString stringWithString:@""];
    for (Teacher *teacher in self.group.teachers)
    {
        [stringOfTeachers appendFormat:@"%@ %@;", teacher.firstName, teacher.lastName];
    }
    return [NSString stringWithFormat:@"{Student}: %@, Average point: %@, teachers: %@", [super description], self.averagePoint, stringOfTeachers];
}

@end
