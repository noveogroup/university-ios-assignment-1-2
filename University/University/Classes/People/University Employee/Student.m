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
        self.gender = [self randomGender];
        if (self.gender == Male) {
            self.firstName = [self randomMaleFirstName];
        } else {
            self.firstName = [self randomFemaleFirstName];
        }
        self.lastName = [self randomLastName];
        NSUInteger minAge = 16;
        NSUInteger maxAge = 25;
        self.age = [self randomAgeFromMin:minAge toMax:maxAge];
        self.GPA = [self randomGPA];
        self.type = @"Student";
        
        self.eData = [EmployeeData sharedInstance];
        self.eData.delegate = self;
        [self.eData addObj:self];
    }
    return self;
}

- (NSString *)detailedDescription {
    NSString *gender = self.gender == Male ? @"Male" : @"Female";
    
    NSString *string = [NSString stringWithFormat: @"\nStudent\n"
                        "FullName: %@ %@\n"
                        "Gender: %@\n"
                        "Age: %ld\n"
                        "GPA: %.2f\n", self.firstName, self.lastName, gender, self.age, self.GPA];
    
    return string;
}

- (void)getSubordinatesList {
    NSLog(@"%@", [self description]);
    if ([self.subordinates count] != 0) {
        for (id <UniversityEmployee> object in self.subordinates) {
            [object getSubordinatesList];
        }
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"|---- %@, %@ %@, GPA - %.2f", self.type, self.firstName, self.lastName, self.GPA];
}

- (CGFloat)randomGPA {
    NSInteger max = 500;
    NSInteger min = 100;
    CGFloat value = (float)(arc4random() % (max - min) + min) / 100;
    return value;
}

- (CGFloat)changeGPAtoNewGPA:(CGFloat)newGPA withIdentifier:(NSString *)identifier {
    CGFloat index = newGPA / self.GPA;
    [self.eData changeGPAWithIndex:index withIdentifier:identifier];
    self.GPA = newGPA;
    return newGPA;
}


@end
