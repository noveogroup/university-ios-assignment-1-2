//
//  Human.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

enum {
    kHumanGenderIsNotDefined = 0,
    kHumanGenderIsMale = 1,
    kHumanGenderIsFemale = 2
};

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *gender;

- (id) initWith:(NSString *) firstName
               :(NSString *) lastName
               :(NSString *) nickName
               :(NSNumber *) age
               :(NSNumber *) gender;

- (NSString *) getGenderAsString;


@end
