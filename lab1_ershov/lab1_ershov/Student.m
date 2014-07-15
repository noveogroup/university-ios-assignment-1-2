//
//  Student.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Student.h"

@implementation Student

- (Student *)initWithName:(NSString *)name Birthday:(NSDate *)birthday AverageMark:(double)averageMark {
    self.name = name;
    self.birthday = birthday;
    self.averageMark = averageMark;

    return self;
}

- (double)getAverageMark {
    return _averageMark;
}


- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"Student:\r\tName: %@\r\tAge: %ld\r\tAverage mark: %lf\r", [self name], [self getAge], [self averageMark]];

    return descriptionString;
}

@end
