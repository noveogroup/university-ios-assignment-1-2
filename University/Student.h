//
//  Student.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"

@class Group;
@class Diary;

@interface Student : Human

@property (copy) NSString *name;
@property (copy) NSString *birthday;
@property (weak) Diary *diary;
@property (weak) Group *group;

// Start initialization
- (id)initWithName:(NSString *)name
       andBirthday:(NSString *)birthday
          andGroup:(Group *)group;

@end
