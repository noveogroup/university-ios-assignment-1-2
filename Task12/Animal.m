//
//  Animal.m
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Animal ()

@property(nonatomic) NSInteger calories;
@property(nonatomic) NSMutableArray *mStomach;

@end

@implementation Animal

@synthesize name = _name;
@synthesize stomach = _stomach;
@synthesize calories = _calories;

- (NSArray *)stomach
{
    return [self.mStomach copy];
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _mStomach = [NSMutableArray array];
    }
    return self;
}

- (void)eat:(Creature *)creature withCalories:(NSInteger)calories
{
    self.calories += calories;
    [self.mStomach addObject: creature];
}

- (BOOL)isProtected
{
    return arc4random()%2 == 0;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@(%ld)", self.name, self.calories];
}

@end
