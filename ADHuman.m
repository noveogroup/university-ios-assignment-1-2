//
//  ADHuman.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADHuman.h"

@implementation ADHuman
- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class ADHuman is initialized");
    }
    return self;
}

+ (void) whoAreYou {
    NSLog(@"I am ADHumanClass %@", self);
}


- (void) sayHello {
    NSLog(@"ADHuman says hello! %@", self);
}

- (void) say:(NSString*) string {
    NSLog(@"%@", string);
}

- (void) say:(NSString*) string and:(NSString*) string2 {
    NSLog(@"%@, %@", string, string2);
}

- (void) say:(NSString*) string and:(NSString*) string2 andAfterThat:(NSString*) string3 {
    NSLog(@"%@, %@, %@", string, string2, string3);
}


- (NSString*) saySomeNumberString {
    
    return [NSString stringWithFormat:@"%@", [NSDate date]];
    
}

- (NSString*) saySomething {
    
    NSString* string = [self saySomeNumberString];
    
    return string;
}

@end
