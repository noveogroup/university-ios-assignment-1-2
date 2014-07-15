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

NSString *const kStringHumanGenderIsNotDefined = @"It";
NSString *const kStringHumanGenderIsMale = @"Male";
NSString *const kStringHumanGenderIsFemale = @"Female";

#pragma mark -
#pragma mark Initializers

- (id)  init {
    if ([self initWith:@"Kadaver" :@"Ambruasievitch" :@"Vybegallo" :[NSNumber numberWithInt:0] :[NSNumber numberWithInt:kHumanGenderIsNotDefined]]) {
    }
    return self;
}

- (id) initWith:(NSString *)firstName
               :(NSString *)lastName
               :(NSString *)nickName
               :(NSNumber *)age
               :(NSNumber *)gender {
    if (self=[super init]) {
        _firstName = firstName;
        _lastName = lastName;
        _nickName = nickName;
        _age = [NSNumber numberWithInt:[age intValue]];
        _gender = [NSNumber numberWithInt:[gender intValue]];
    }
    return self;
}

#pragma mark -
#pragma mark Custom Methods

- (NSString *) getGenderAsString {
    switch ([self.gender intValue]) {
        case kHumanGenderIsMale:
            return kStringHumanGenderIsMale;
            break;
            
        case kHumanGenderIsFemale:
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
