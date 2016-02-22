//
//  Course.h
//  University
//
//  Created by Oleg Sannikov on 2/21/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Teacher, Student;

@interface Course : NSObject
//! Designated initializer
- (instancetype)initWithName:(NSString *)name andTeacher:(Teacher *)teacher;
+ (instancetype)courseWithName:(NSString *)name andTeacher:(Teacher *)teacher;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic) Teacher *teacher;
@property (nonatomic, readonly) NSSet<Student *> *participants;
@property (nonatomic, readonly) float meanGrade;

- (void)addParticipant:(Student *)participant;
- (void)addParticipants:(NSArray<Student *> *)participants;

@end
