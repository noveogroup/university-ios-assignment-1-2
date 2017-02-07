//
//  UniversitySingleton.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/16/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "UniversitySingleton.h"

@implementation UniversitySingleton

static UniversitySingleton *sharedSingleton_ = nil;

+ (instancetype) sharedInstance {
    @synchronized(self){
        if (sharedSingleton_==nil) {
            sharedSingleton_ = [[UniversitySingleton alloc]init];
        }
    }
    return sharedSingleton_;
}

- (NSNumber *)recalculatePoints:(__weak id<EducationMember>)sender {
    if (!_headOfUniversity) {
        NSLog(@"University can't work w/o Rector. Please register the Rector before using University service.");
        return [NSNumber numberWithFloat:0.0];
    }
    NSNumber *cachedPoints = [_headOfUniversity averagePoints];
    NSLog(@"Average points of University is: %f",[cachedPoints floatValue]);
    return cachedPoints;
}


@end
