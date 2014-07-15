//
//  Human.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Human.h"

@implementation Human

- (long)getAge {
    NSDate *startDate = [self birthday];
    NSDate *endDate = [[NSDate alloc]init];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags = NSYearCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:startDate
                                                  toDate:endDate
                                                 options:0];
    return [components year];
}

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"Human:\r\tName: %@\r\tAge: %ld\r", [self name], [self getAge]];
    return descriptionString;
}

@end
