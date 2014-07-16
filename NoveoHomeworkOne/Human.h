//
//  Human.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

typedef enum {
    humanGenderIsNotDefined = 0,
    humanGenderIsMale = 1,
    humanGenderIsFemale = 2
} HumanGender;


@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, strong) NSNumber *age; // Debugged
@property (nonatomic, assign) HumanGender gender;



- (id) initWithFirstName:(NSString *)newFirstName
                lastName:(NSString *)newLastName;

- (id) initWithFirstName:(NSString *) newFirstName
                lastName:(NSString *) newLastName
                nickName:(NSString *) newNickName
                     age:(NSNumber *) newAge
                  gender:(HumanGender) newGender;

- (NSString *) getGenderAsString;

@end
