//
//  Department.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"

@class Group;

@interface Department : NSObject <HasAverageMark>

@property (readonly) NSMutableArray *groups;

//-(void)addGroup:(Group *)group;

@end
