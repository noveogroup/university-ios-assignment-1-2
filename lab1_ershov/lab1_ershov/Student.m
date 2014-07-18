//
//  Student.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Student.h"
#import "Observer.h"

@interface Student ()

@property (nonatomic) NSMutableArray *marks;
@property (nonatomic) NSMutableSet *observers;
@property (nonatomic) double mAverageMark;

@end

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self) {
        self.marks = [[NSMutableArray alloc] init];
        self.observers = [[NSMutableSet alloc] init];
    }

    return self;
}


- (void)addMark:(int)mark {
    [self.marks addObject:[NSNumber numberWithInt:mark]];
    [self refreshAverageMark];

    [self notifyAll];
}

- (void)refreshAverageMark {
    int summaryMark = 0;

    for (NSNumber *mark in self.marks) {
        summaryMark += mark.intValue;
    }

    self.mAverageMark = summaryMark / [self.marks count];
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

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"Student:\r\tName: %@\r\tAge: %ld\r\tAverage mark: %lf\r", self.name, [self getAge], self.averageMark];

    return descriptionString;
}




@end
