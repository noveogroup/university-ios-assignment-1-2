//
//  Person.h
//  University
//
//  Created by Oleg Sannikov on 2/14/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Gender) {
    GenderMale,
    GenderFemale,
    GenderUndefined,
};

@interface Person : NSObject
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
                           gender:(Gender)gender andBirthdate:(NSDate *)birthdate NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithPerson:(Person *)person NS_DESIGNATED_INITIALIZER;

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (nonatomic) Gender gender;
@property (nonatomic) NSDate *birthdate;

@end
