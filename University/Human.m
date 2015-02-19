//
//  Human.m
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Human.h"

@implementation Human

- (id)initWithName:(NSString *)name andBirthday:(NSString *)birthday
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.birthday = birthday;
    }
    
    return self;
}

- (void)description
{
    NSString *className = NSStringFromClass([Human class]);
    NSString *personName = [self name];
    NSString *personAge = [self birthday];
    
    NSLog(@"For class: %@\nName: %@\nBirthday: %@", className, personName, personAge);
}

@end
