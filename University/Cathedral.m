//
//  Cathedral.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Cathedral.h"
#import "Group.h"

@interface Cathedral ()

@property NSMutableArray *mutGroups;

@end

@implementation Cathedral

// Start initialization
- (id)initWithName:(NSString *)name andFaculty:(Faculty *)faculty
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.faculty = faculty;
        self.mutGroups = [[NSMutableArray alloc] init];
    }
    
    return self;
}

// Add new Student to this group
- (void)addGroup:(Group *)group
{
    [self.mutGroups addObject:group];
}

// Find and return object by name
- (Student *)findStudentByName:(NSString *)name
{
    NSArray *groups = [[NSArray alloc] initWithArray:self.mutGroups];
    for(NSUInteger i = 0; i < [groups count]; i++)
    {
        NSArray *students = [[NSArray alloc] initWithArray:[[groups objectAtIndex:i] getStudents]];
        for(NSUInteger j = 0; j < [students count]; j++)
        {
            if([[[students objectAtIndex:j] name] isEqualToString:name])
            {
                return [students objectAtIndex:j];
            }
        }
    }
    NSLog(@"2");
    return nil;
}

// Get array, which contained list of students
- (NSArray *)getGroups
{
    return [self.mutGroups copy];
}

@end
