//
//  Group.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Group.h"
#import "Cathedral.h";

@interface Group ()

@property NSMutableArray *mutStudents;

@end

@implementation Group

// Start initialization
- (id)initWithName:(NSString *)name andCathedral:(Cathedral *)cathedral
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.cathedral = cathedral;
        self.mutStudents = [[NSMutableArray alloc] init];
        
        [self.cathedral addGroup:self];
    }
    
    return self;
}

// Add new Student to this group
- (void)addStudent:(Student *)student
{
    [self.mutStudents addObject:student];
}

// Get array, which contained list of students
- (NSArray *)getStudents
{
    return [self.mutStudents copy];
}

@end
