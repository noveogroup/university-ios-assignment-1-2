//
//  Employee.m
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Employee.h"

@implementation Employee
- (instancetype)init{
    self = [super init];
    if (self) {
        _salary = @(arc4random_uniform(30000));
    }
    return self;
}

- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rSalary: %@", self.salary]];
}

@end
