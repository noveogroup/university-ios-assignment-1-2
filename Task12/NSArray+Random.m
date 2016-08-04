//
//  NSObject+NSArray.m
//  Task12
//
//  Created by Sergey Plotnikov on 11.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)randomObject
{
    if ([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex: arc4random() % [self count]];
}

@end
