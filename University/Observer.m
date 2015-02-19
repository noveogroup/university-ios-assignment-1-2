//
//  Observer.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Observer.h"
#import "Header.h"

@interface Observer ()

@property NSMutableDictionary *mutJournal;

@end

@implementation Observer

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.mutJournal = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

+ (Observer *)sharedInstance
{
    static dispatch_once_t once;
    static Observer *instance;
    
    dispatch_once(&once, ^{
        instance = [[Observer alloc] init];
    });
    
    return instance;
}

- (void)addAverageMark:(NSNumber *)mark toStudent:(Student *)student
{
    [self.mutJournal setObject:mark forKey:[student name]];
}

- (double)getAverageMarkOfCathedral:(Cathedral *)cathedral
{
    double result = 0.0;
    NSUInteger amount = 0;
    
    for(id key in [self.mutJournal allKeys])
    {
        Student *student = [cathedral findStudentByName:key];
        
        if([[[student group] cathedral] name] == [cathedral name])
        {
            
            result += [[self.mutJournal objectForKey:[student name]] doubleValue];
            amount++;
        }
    }
    
    if(amount == 0)
    {
        return 0;
    }

    return (result / amount);
}

- (NSDictionary *)globalJournal
{
    return [self.mutJournal copy];
}

@end
