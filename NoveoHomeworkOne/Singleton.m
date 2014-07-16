//
//  Singleton.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/16/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedSingleton_ = nil;

+ (Singleton *) sharedInstance {
    @synchronized(self){
        if (sharedSingleton_==nil) {
            sharedSingleton_ = [[Singleton alloc]init];
        }
    }
    return sharedSingleton_;
}

- (NSNumber *)recalculatePoints {
    if (!_headOfUniversity) {
        NSLog(@"University can't work w/o Rector. Please register the Recor before using University.");
        return [NSNumber numberWithFloat:0.0];
    }
    NSNumber *cachedPoints = [_headOfUniversity averagePoints];
    NSLog(@"Average points of University is: %f",[cachedPoints floatValue]);
    return cachedPoints;
}


@end
