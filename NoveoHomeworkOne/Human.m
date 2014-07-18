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

static NSString *const kStringHumanGenderIsNotDefined = @"It"; // Debuged
static NSString *const kStringHumanGenderIsMale = @"Male";
static NSString *const kStringHumanGenderIsFemale = @"Female";

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
    return [self initWithFirstName:newFirstName
                          lastName:newLastName
                          nickName:defaultNickName
                               age:[NSNumber numberWithInt:defaultAge]
                            gender:humanGenderIsNotDefined];
}

// Decignated initializer
- (instancetype) initWithFirstName:(NSString *) newFirstName
                lastName:(NSString *) newLastName
                nickName:(NSString *) newNickName
                     age:(NSNumber *) newAge
                  gender:(HumanGender) newGender {
    if (self=[super init]) {
        _firstName = newFirstName;
        _lastName = newLastName;
        _nickName = newNickName;
        _age = newAge;
        _gender = newGender;
    }
    return self;
}


#pragma mark -
#pragma mark Custom Methods

- (NSString *) getGenderAsString
{
    switch (_gender) {
        case humanGenderIsMale:
            return kStringHumanGenderIsMale;
            break;
            
        case humanGenderIsFemale:
            return kStringHumanGenderIsFemale;
            break;
            
        default:
            return kStringHumanGenderIsNotDefined;
            break;
    }
}

- (NSString *)description {
    return @"I'm just a fun description for any Human!";
}
 
@end
