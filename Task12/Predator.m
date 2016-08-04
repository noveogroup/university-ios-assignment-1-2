//
//  Predator.m
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Predator.h"

@interface Predator()

@property(nonatomic) NSInteger weight;

@end

@implementation Predator

@synthesize name = _name;
@synthesize calories = _calories;
@synthesize weight = _weight;

- (instancetype)initWithName:(NSString *)aName weight:(NSInteger)aWeight
{
    self = [super init];
    
    if (self) {
        _name = aName;
        _calories = kDefaultPredatorCalories;
        _weight = aWeight;
    }
    
    return self;
}

- (void)setCalories:(NSInteger)calories
{
    _calories = calories;
}

@end