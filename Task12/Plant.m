//
//  Plant.m
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Plant.h"


@interface Plant()

@property(nonatomic) NSString* name;
@property(nonatomic) NSInteger calories;

@end


@implementation Plant

@synthesize name = _name;
@synthesize calories = _calories;

- (instancetype)initWithName:(NSString *)aName
{
    self = [super init];
    
    if (self) {
        _name = aName;
        _calories = kDefaultPlantCalories;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@(%ld)", self.name, self.calories];
}

@end