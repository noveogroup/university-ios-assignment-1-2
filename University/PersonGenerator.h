//
//  PersonGenerator.h
//  University
//
//  Created by Oleg Sannikov on 2/22/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person, Student, Teacher, DepartmentChief;

@interface PersonGenerator : NSObject
- (Person *)randomPerson;

@end
