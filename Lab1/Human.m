//
//  Human.m
//  Lab1
//
//  Created by Admin on 15/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"

@implementation Human

+(instancetype) humanWithFullName:(NSString *)fullName age:(NSNumber *)age{
    
    return [[self alloc] initWithFullName:fullName age:age];
}

-(instancetype) initWithFullName:(NSString *)fullName age:(NSNumber *)age{
    
    self = [self init];
    
    self.fullname = fullName;
    self.age = age;
    
    return self;
}

@end