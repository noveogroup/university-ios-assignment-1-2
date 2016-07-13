//
//  Herbivorous.m
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Herbivorous.h"

@implementation Herbivorous

@synthesize name = _name;
@synthesize calories = _calories;

- (instancetype)initWithName:(NSString *)aName
{
    self = [super init];
    
    if (self) {
        _name = aName;
        _calories = kDefaultHerbivorousCalories;
    }
    
    return self;
}

- (void)setCalories:(NSInteger)calories
{
    _calories = calories;
}

@end