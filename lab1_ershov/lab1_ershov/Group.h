//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"


@interface Group : NSObject <HasAverageMark>

@property NSString *name;
@property NSMutableArray *students;

@end