//
//  Student.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (Student *)initStudentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andAveragePoint:(NSNumber *) aPoint
{
    self = [self initWithFirstName:firstName lastName:lastName andAge:age];
    self.averagePoint=aPoint;
    return self;
}


@end
