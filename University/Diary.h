//
//  Diary.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@class Subject;

@interface Diary : NSObject

@property (weak) Student *owner;

- (id)initWithOwner:(Student *)owner;
- (id) initWithOwner:(Student *)owner andSubjectList:(NSArray *)subjectList;
- (void)addSubject:(Subject *)subject;
- (void)setMark:(NSUInteger)mark toSubject:(Subject *)subject;
- (double)getAverageMarkOfSubject:(Subject *)subject;
- (double)getAverageMarkOfAllSubjects;

@end
