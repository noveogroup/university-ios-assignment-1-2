//
//  Subject.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Subject.h"

@interface Subject ()

// Marks on this subject
@property NSMutableArray *mutMarks;

@end

@implementation Subject

- (id)initWithName:(NSString *)subjectName
{
    self = [super init];
    
    if (self)
    {
        self.name = subjectName;
        self.mutMarks = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addMark:(NSUInteger)mark
{
    NSNumber *markObject = [NSNumber numberWithInt:mark];
    [self.mutMarks addObject:markObject];
}

- (NSArray *)getMarks
{
    return [self.mutMarks copy];
}

@end
