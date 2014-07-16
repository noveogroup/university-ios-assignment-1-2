//
//  Human.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

@property (copy) NSString* name;
@property (copy) NSDate* birthday;

- (instancetype)initWithName:(NSString *)name
                    Birthday:(NSDate *)birthday;

- (instancetype)initWithName:(NSString *)name
              BirthdayString:(NSString *)birthdayString;

- (long)getAge;

@end
