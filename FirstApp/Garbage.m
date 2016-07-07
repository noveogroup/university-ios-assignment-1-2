//
//  Garbage.m
//  FirstApp
//
//  Created by Admin on 06.07.16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Garbage.h"

@implementation Garbage

-(NSString *)description{
    return [NSString stringWithFormat:@"Garbage with calories: %.1f", self.calories];
}

-(double)calories{
    return -1;
}

@end
