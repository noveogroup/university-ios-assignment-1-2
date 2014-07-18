//
//  Human.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Human.h"

@implementation Human

@synthesize firstName = _firstName, lastName =_lastName, nickName = _nickName, age =_age, gender=_gender;

static const int defaultAge = 7;

static NSString *const defaultFirstName = @"Unknown Firstname";
static NSString *const defaultLastName = @"Unknown Lastname";
static NSString *const defaultNickName = @"Unknown Nickname";

#pragma mark -
#pragma mark Initializers

- (instancetype)  init {
    return [self initWithFirstName:defaultFirstName
                          lastName:defaultLastName];
}

- (instancetype) initWithFirstName:(NSString *)newFirstName
                          lastName:(NSString *)newLastName {
    // Return
    return [self initWithFirstName:newFirstName
                          lastName:newLastName
                          nickName:defaultNickName
                               age:[NSNumber numberWithInt:defaultAge]
                            gender: humanGenderIsNotDefined];
}

// Designated initializer
- (instancetype) initWithFirstName:(NSString *) newFirstName
                          lastName:(NSString *) newLastName
                          nickName:(NSString *) newNickName
                               age:(NSNumber *) newAge
                            gender:(HumanGenderId) newGenderId {
    // Start initializer
    if (self=[super init]) {
        _firstName = newFirstName;
        _lastName = newLastName;
        _nickName = newNickName;
        _age = newAge;
        _gender = [[Gender alloc]initGenderWithGenderId:newGenderId];
    }
    return self;
}


#pragma mark -
#pragma mark Custom Methods

- (NSString *) getGenderAsString
{
    return [_gender description];
}

- (NSString *) description {
    return @"I'm just a fun description for any Human!";
}

- (void) setGenderWithHumanGenderId:(HumanGenderId)newHumanGenderId {
    [_gender setCurrentHumanGenderId:newHumanGenderId];
}
 
@end
