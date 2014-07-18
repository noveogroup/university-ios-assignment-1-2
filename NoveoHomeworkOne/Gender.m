//
//  Gender.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/18/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Gender.h"

@implementation Gender

static NSString *const kStringHumanGenderIsNotDefined = @"It"; // Debugged
static NSString *const kStringHumanGenderIsMale = @"Male";
static NSString *const kStringHumanGenderIsFemale = @"Female";

@synthesize currentHumanGenderId = _currentHumanGenderId;


#pragma mark -
#pragma mark Initializers
// Designated initializer
- (instancetype) initGenderWithGenderId: (HumanGenderId)aGenderId {
    if (self = [super init]) {
        _currentHumanGenderId = aGenderId;
    }
    return self;
}

- (instancetype) init {
    return [self initGenderWithGenderId:humanGenderIsNotDefined];
}

#pragma mark -
#pragma mark Overrided Methods

- (NSString *) description {
    switch (_currentHumanGenderId) {
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

@end
