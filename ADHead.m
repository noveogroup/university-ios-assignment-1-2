//
//  ADHead.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADHead.h"

@implementation ADHead

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class ADHead is initialized");
    }
    return self;
}


- (NSString*) saySomeNumberString {
    
    return @"Something!";
}

- (NSString*) saySomething {
    
    return [self saySomeNumberString];
}

@end
