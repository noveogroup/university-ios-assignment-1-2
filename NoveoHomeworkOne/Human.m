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

#pragma mark -
#pragma mark Initializers

- (id)  init {
    if ([self initWith:@"Kadaver" :@"Ambruasievitch" :@"Vybegallo" :[NSNumber numberWithInt:0] :humanGenderIsMale]) {
    }
    return self;
}

- (id) initWith:(NSString *)firstName
               :(NSString *)lastName
               :(NSString *)nickName
               :(NSNumber *)age
               :(HumanGender)gender {
    if (self=[super init]) {
        _firstName = firstName;
        _lastName = lastName;
        _nickName = nickName;
        _age = [NSNumber numberWithInt:[age intValue]];
        _gender = humanGenderIsNotDefined;
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

/*
- (void) dealloc {
    [_firstName release];
    [_lastName release];
    [_nickName release];
    [_age release];
    [_gender release];
    [super dealloc];
}
*/
 
@end
