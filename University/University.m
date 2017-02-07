//
//  University.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "University.h"

@interface University ()

@property NSMutableArray *mutFaculties;

@end

@implementation University

- (id)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.mutFaculties = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addFaculty:(Faculty *)faculty
{
    [self.mutFaculties addObject:faculty];
}

- (NSArray *)getFaculties
{
    return [self.mutFaculties copy];
}

@end
