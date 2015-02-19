//
//  Teacher.h
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"

@class Student;

@interface Teacher : Human

- (void)description;
- (NSArray *)students;
- (void)addStudent:(Student *)student;

@end
