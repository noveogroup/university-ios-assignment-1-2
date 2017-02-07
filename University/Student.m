//
//  Student.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import "Student.h"
#import "Group.h"

@implementation Student

@synthesize diary;

- (id)initWithName:(NSString *)name andBirthday:(NSString *)birthday
          andGroup:(Group *)group
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.birthday = birthday;
        self.group = group;
        
        [self.group addStudent:self];
    }
    
    return self;
}

@end
