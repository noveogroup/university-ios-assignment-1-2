//
//  Gender.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/18/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gender : NSObject

typedef enum {
    humanGenderIsNotDefined = 0,
    humanGenderIsMale = 1,
    humanGenderIsFemale = 2
} HumanGenderId;

@property (nonatomic, assign) HumanGenderId currentHumanGenderId;

- (instancetype) initGenderWithGenderId: (HumanGenderId)aGenderId;

@end
