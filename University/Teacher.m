//
//  Teacher.m
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Teacher.h"

@interface Teacher ()

@property NSMutableArray *mutStudents;

@end

@implementation Teacher

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.mutStudents = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addStudent:(Student *)student
{
    [self.mutStudents addObject:student];
}

- (NSArray *)students
{
    return [self.mutStudents copy];
}

- (void)description
{
    NSString *className = NSStringFromClass([Teacher class]);
    NSString *personName = [self name];
    NSString *personAge = [self birthday];
    
    NSLog(@"For class: %@\nName: %@\nBirthday: %@", className, personName, personAge);
}

@end
