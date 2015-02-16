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

@property (nonatomic, strong) NSMutableArray *observersList;

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

- (NSArray *)getInferiors
{
    return nil;
}

- (NSArray *)getSuperiors
{
    return _group.teacherList;
}

- (void)addObserverForStudent:(id<AveragePointObserver>) observer
{
    if (self.observersList == nil)
    {
        self.observersList = [[NSMutableArray alloc]init];
    }
    [self.observersList addObject:observer];
}

- (void)removeObserverForStudent:(id<AveragePointObserver>) observer
{
    [self.observersList removeObject:observer];
}

-(void)notifyObservers
{
    for (id<AveragePointObserver> observer in self.observersList)
    {
        [observer recalculateAveragePoint];
    }
}

@end
