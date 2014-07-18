//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Group.h"
#import "Student.h"

@interface Group ()

@property (nonatomic) NSMutableArray *mStudents;
@property (nonatomic) NSMutableSet *observers;
@property (nonatomic) double mAverageMark;

@end

@implementation Group

- (instancetype)init {
    self = [super init];
    if (self) {
        _mStudents = [[NSMutableArray alloc] init];
        _observers = [[NSMutableSet alloc] init];
    }

    return self;
}


- (instancetype)initWithName:(NSString *)name {
    self = [self init];

    self.name = name;

    return self;
}

- (void)addStudent:(Student *)student {
    [self.mStudents addObject:student];
    [self refreshAverageMark];
}

- (void)refreshAverageMark {
    double summaryMark = 0;

    for (Student *student in self.students) {
        summaryMark += student.averageMark;
    }

    self.mAverageMark = summaryMark / [self.students count];
    [self dataChanged];
}

- (double)averageMark {
    return self.mAverageMark;
}


- (void)addObserver:(id <Observer>)observer {
    [self.observers addObject:observer];
}

- (void)notifyAll {
    for (id<Observer> observer in self.observers) {
        [observer dataChanged];
    }
}

- (void)dataChanged {
    [self notifyAll];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"Group \"%@\":\n", _name];

    [description appendFormat:@"\tAverage mark: %lf\n", self.averageMark];

    [description appendString:@"\tStudents:\n"];

    int i = 1;
    for (Student *student in self.students) {
        [description appendFormat:@"\t%d. %@\n", i++, student.name];
    }

    return description;
}

- (NSArray *)students {
    return self.mStudents;
}

@end