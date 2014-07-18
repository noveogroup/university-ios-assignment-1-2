//
// Created by Admin on 15/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HasAverageMark <NSObject>

@required
@property (nonatomic, readonly) double averageMark;
- (void)refreshAverageMark;

@end