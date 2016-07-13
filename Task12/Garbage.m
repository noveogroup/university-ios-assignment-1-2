//
//  Garbage.m
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Garbage.h"


@interface Garbage()

@property(nonatomic) NSInteger calories;

@end


@implementation Garbage

@synthesize calories = _calories;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _calories = kDefaultGarbageCalories;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Мусор(%ld)", self.calories];
}

@end