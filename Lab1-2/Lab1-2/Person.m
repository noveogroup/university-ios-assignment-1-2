//
//  Person.m
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype) initWithFirstName:(NSString *)fName lastName:(NSString *)lName andAge:(NSNumber *)age
{
    self = [self init];
    if (self != nil)
    {
        _firstName = fName;
        _lastName = lName;
        _age = age;
    }
   
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Firsr name: %@, Last name: %@, age: %@", self.firstName, self.lastName, self.age];
}

@end
