//
// Created by Admin on 16/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Observer;

@protocol Observable <NSObject>
- (void)addObserver:(id<Observer>)observer;
- (void)notifyAll;
@end