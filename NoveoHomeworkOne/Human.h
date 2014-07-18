//
//  Human.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gender.h"

@interface Human : NSObject

@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, strong, readonly) NSNumber *age; // Debugged
@property (nonatomic, strong, readonly) Gender *gender;



- (instancetype) initWithFirstName:(NSString *)newFirstName
                          lastName:(NSString *)newLastName;

- (instancetype) initWithFirstName:(NSString *) newFirstName
                          lastName:(NSString *) newLastName
                          nickName:(NSString *) newNickName
                               age:(NSNumber *) newAge
                            gender:(HumanGenderId) newGenderId;

- (NSString *) getGenderAsString;
- (void) setGenderWithHumanGenderId: (HumanGenderId) newGenderId;

@end
