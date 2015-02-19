//
//  Faculty.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Faculty.h"
#import "University.h"

@interface Faculty ()

@property NSMutableArray *mutCathedrals;

@end

@implementation Faculty

// Start initialization
- (id)initWithName:(NSString *)name andUniversity:(University *)university
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.university = university;
        self.mutCathedrals = [[NSMutableArray alloc] init];
        
        [self.university addFaculty:self];
    }
    
    return self;
}

// Add new Student to this group
- (void)addCathedral:(Cathedral *)cathedral
{
    [self.mutCathedrals addObject:cathedral];
}

// Get array, which contained list of students
- (NSArray *)getCathedrals
{
    return [self.mutCathedrals copy];
}

@end
