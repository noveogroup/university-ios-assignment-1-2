//
//  Human.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    Male,
    Female
} Gender;

@interface Human : NSObject
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) NSInteger age;

- (Gender)randomGender;
- (NSInteger)randomAgeFromRange:(NSRange)range;
- (NSString *)randomMaleFirstName;
- (NSString *)randomFemaleFirstName;
- (NSString *)randomLastName;

@end
