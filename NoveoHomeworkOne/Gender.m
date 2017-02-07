//
//  Gender.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/18/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Gender.h"

@implementation Gender

#pragma mark -
#pragma Static Singleton Array

+ (NSArray *)descriptions
{
    static NSArray *genderNames = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        genderNames = @[@"Undefined gender", @"Male", @"Female"];
    });
    return genderNames;
}

@end
