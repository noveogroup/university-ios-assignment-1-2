//
//  HeadOfDepartment.m
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "HeadOfDepartment.h"

@interface HeadOfDepartment ()

@property NSMutableArray *mutStudents;
@property NSMutableArray *mutTeachers;

@end

@implementation HeadOfDepartment

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.mutStudents = [[NSMutableArray alloc] init];
        self.mutTeachers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addStudent:(Student *)student
{
    [self.mutStudents addObject:student];
}

- (void)addTeacher:(Teacher *)teacher
{
    [self.mutTeachers addObject:teacher];
}

- (NSArray *)students
{
    return [self.mutStudents copy];
}

- (NSArray *)teachers
{
    return [self.mutTeachers copy];
}

- (void)description
{
    NSString *className = NSStringFromClass([HeadOfDepartment class]);
    NSString *personName = [self name];
    NSString *personAge = [self birthday];
    
    NSLog(@"For class: %@\nName: %@\nBirthday: %@", className, personName, personAge);
}

@end
