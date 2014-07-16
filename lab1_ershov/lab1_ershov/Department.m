//
//  Department.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Department.h"
#import "Group.h"
#import "Teacher.h"

@protocol HeadOfDepartment;

@interface Department ()

@property NSMutableArray *mGroups;
@property double mAverageMark;

@end

@implementation Department
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.mGroups = [[NSMutableArray alloc] init];
    }

    return self;
}


- (void)addGroup:(Group *)group {
    [self.mGroups addObject:group];
    [group addObserver:self];

    [self refreshAverageMark];
}

- (NSArray *)groups {
    return self.mGroups;
}

- (void)setHeadOfDepartment:(Teacher *)headOfDepartment {
    if ([headOfDepartment respondsToSelector:@selector(addSubordinate:)]) {
        _headOfDepartment = headOfDepartment;
    }
}

- (double)averageMark {
    return self.mAverageMark;
}

- (void)dataChanged {
    [self refreshAverageMark];
}

- (void)refreshAverageMark {
    double summaryMark = 0;

    for (Group *group in self.groups) {
        summaryMark += group.averageMark;
    }

    self.mAverageMark = summaryMark / [self.groups count];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"Department \"%@\":\n", self.name];

    [description appendFormat:@"\tAverage mark: %lf\n", self.averageMark];

    [description appendString:@"\tGroups:\n"];

    int i = 1;
    for (Group *group in self.groups) {
        [description appendFormat:@"\t%d. %@\n", i++, group.description];
    }

    return description;}


@end
