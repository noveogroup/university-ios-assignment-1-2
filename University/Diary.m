//
//  Diary.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Diary.h"
#import "Subject.h"
#import "Student.h"
#import "Observer.h"

@interface Diary ()

@property NSMutableArray *mutSubjects;
@property NSMutableDictionary *mutSubjInfo;

@end

@implementation Diary

@synthesize owner;

- (id) initWithOwner:(Student *)diaryOwner
{
    self = [super init];
    
    if (self)
    {
        self.owner = diaryOwner;
        self.mutSubjects = [[NSMutableArray alloc] init];
        self.mutSubjInfo = [[NSMutableDictionary alloc] init];
        [self.owner setDiary:self];
    }
    
    return self;
}

- (void)addSubject:(Subject *)subject
{
    [self.mutSubjInfo setObject:[[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:0], nil] forKey:[subject name]];
}

- (void)setMark:(NSUInteger)mark toSubject:(Subject *)subject
{
    NSMutableArray *newMarks = [[NSMutableArray alloc] init];
    [newMarks arrayByAddingObjectsFromArray:[self.mutSubjInfo objectForKey:[subject name]]];
    [newMarks addObject:[NSNumber numberWithInteger:mark]];
    
    [self.mutSubjInfo setObject:newMarks forKey:[subject name]];
    
    // Recount average mark on Cathedral
    Observer *obs = [Observer sharedInstance];
    
    NSNumber *averageMark = [NSNumber numberWithDouble:self.getAverageMarkOfAllSubjects];
    [obs addAverageMark:averageMark toStudent:owner];
}

- (double)getAverageMarkOfSubject:(Subject *)subject
{
    NSArray *marks = [self.mutSubjInfo objectForKey:[subject name]];
    double result = 0.0;
    
    for (int i = 0; i < [marks count]; i++)
    {
        result += [[marks objectAtIndex:i] integerValue];
    }
    
    if([marks count] == 0)
    {
        return 0.0;
    }
    
    return (result / [marks count]);
     
}

- (double)getAverageMarkOfAllSubjects
{
    double result = 0.0;
    NSUInteger amount = 0;
    
    for(id key in [self.mutSubjInfo allKeys])
    {
        NSArray *marks = [self.mutSubjInfo objectForKey:key];
        
        for (NSUInteger j = 0; j < [marks count]; j++)
        {
            result += [[marks objectAtIndex:j] integerValue];
            amount++;
        }
    }

    if((amount-1) == 0)
    {
        return 0.0;
    }

    return (result / (amount-1));
}

@end
