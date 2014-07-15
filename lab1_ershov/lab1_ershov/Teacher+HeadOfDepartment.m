//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Teacher+HeadOfDepartment.h"


@implementation Teacher (HeadOfDepartment)

+ (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];

    [description appendString:@">"];
    return description;
}


@end