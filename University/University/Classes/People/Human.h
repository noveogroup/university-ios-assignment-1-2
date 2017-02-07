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
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) NSUInteger age;


int randomAge(int min, int max);

- (NSString *)randomFirstNameForGender:(Gender)gender;
- (NSString *)randomMaleFirstName;
- (NSString *)randomFemaleFirstName;
- (NSString *)randomLastName;

@end
