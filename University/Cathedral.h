//
//  Cathedral.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Group;
@class Faculty;
@class Student;

@interface Cathedral : NSObject

@property (copy) NSString *name;
@property (weak) Faculty *faculty;

- (id)initWithName:(NSString *)name andFaculty:(Faculty *)faculty;
- (void)addGroup:(Group *)group;
- (NSArray *)getGroups;
- (Student *)findStudentByName:(NSString *)name;

@end
