//
//  Department.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"
#import "Observer.h"

@class Group;
@class Teacher;

@interface Department : NSObject <HasAverageMark, Observer>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly, copy) NSArray *groups;
@property (nonatomic) Teacher *headOfDepartment;

- (instancetype)initWithName:(NSString *)name;

- (void)addGroup:(Group *)group;

- (NSString *)description;

@end
