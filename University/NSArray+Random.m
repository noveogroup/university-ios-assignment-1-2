//
//  NSArray+Random.m
//  University
//
//  Created by eligat on 2/25/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)
- (id)randomObject{
    return [self objectAtIndex:arc4random_uniform((unsigned int)self.count)];
}

@end
