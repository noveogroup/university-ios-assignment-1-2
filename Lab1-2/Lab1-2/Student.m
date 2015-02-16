//
//  Student.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Student.h"
#import "Group.h"

@interface Student ()

@property (nonatomic, strong) NSMutableArray *observers;

@end


@implementation Student

- (Student *)initStudentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andAveragePoint:(NSNumber *) aPoint
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    self.averagePoint=aPoint;
    return self;
}

- (void)changeAveragePoint:(NSNumber *)newPoint
{
    self.averagePoint=newPoint;
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

- (void)addObserverForStudent:(id<AveragePointObserver>) observer
{
    if (self.observers == nil)
    {
        self.observers = [[NSMutableArray alloc]init];
    }
    [self.observers addObject:observer];
}

- (void)removeObserverForStudent:(id<AveragePointObserver>) observer
{
    [self.observers removeObject:observer];
}

-(void)notifyObservers
{
    for (id<AveragePointObserver> observer in self.observers)
    {
        [observer recalculateAveragePoint];
    }
}

@end
