//
//  Garbage.m
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Garbage.h"

@implementation Garbage

- (float)calories {
    
    return -1;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Garbage with calories: %f", self.calories];
}

@end
