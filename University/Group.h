//
//  Group.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@class Cathedral;

@interface Group : NSObject

@property (copy) NSString *name;
@property (copy) NSString *starosta;
@property (weak) Cathedral *cathedral;

- (id)initWithName:(NSString *)name andCathedral:(Cathedral *)cathedral;
- (void)addStudent:(Student *)student;
- (NSArray *)getStudents;

@end
