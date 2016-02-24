//
//  Person.m
//  University
//
//  Created by Oleg Sannikov on 2/14/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Person.h"

@implementation Person
#pragma mark - Lifecycle
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
                           gender:(Gender)gender andBirthdate:(NSDate *)birthdate{
    self = [self init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _gender = gender;
        _birthdate = birthdate;
    }
    
    return self;
}

- (instancetype)initWithPerson:(Person *)person{
    self = [self init];
    if (self) {
        _firstName = person.firstName;
        _lastName = person.lastName;
        _gender = person.gender;
        _birthdate = person.birthdate;
    }
    
    return self;
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\r%@ %@, %@\rBirthdate: %@", self.firstName, self.lastName, [Person stringWithGender:self.gender], self.birthdate]];
}


#pragma mark - Private
+ (NSString *)stringWithGender:(Gender)gender{
    switch (gender) {
        case GenderMale:
            return @"Male";
            
        case GenderFemale:
            return @"Female";
            
        default:
            return @"Undefined";
    }
}

@end
