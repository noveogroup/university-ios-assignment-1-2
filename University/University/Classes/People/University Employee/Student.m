//
//  Student.m
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Student.h"



@implementation Student

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gender = arc4random() % 2;
        self.firstName = [self randomFirstNameForGender:self.gender];
        self.lastName = [self randomLastName];
        int minAge = 16;
        int maxAge = 25;
        self.age = randomAge(minAge, maxAge);
        self.GPA = randomGPA();
        self.type = @"Student";
    }
    return self;
}

- (NSString *)detailedDescription {
    NSString *gender = self.gender == Male ? @"Male" : @"Female";
    
    NSString *string = [NSString stringWithFormat: @"\n"
                        "Student\n"
                        "FullName: %@ %@\n"
                        "Gender: %@\n"
                        "Age: %ld\n"
                        "GPA: %.2f\n", self.firstName, self.lastName, gender, self.age, self.GPA];
    
    return string;
}

- (void)getSubordinatesList {
    NSLog(@"%@", self);
    if ([self.subordinates count] != 0) {
        for (id <UniversityEmployee> object in self.subordinates) {
            [object getSubordinatesList];
        }
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"|---- %@, %@ %@, GPA - %.2f", self.type, self.firstName, self.lastName, self.GPA];
}

float randomGPA (void) {
    NSInteger max = 500;
    NSInteger min = 100;
    float value = (float)(arc4random() % (max - min) + min) / 100;
    return value;
}

@end
