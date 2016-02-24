//
//  Student.m
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Student.h"
#import "Course.h"
#import "Teacher.h"

@interface Student (){
    NSMutableSet<Course *> *_courses;
    NSMutableSet<Teacher *> *_teachers;
}

@end

@implementation Student
#pragma mark - Liecycle
- (instancetype)init{
    self = [super init];
    if (self) {
        _courses = [NSMutableSet new];
        _meanGrade = 2 + (float)arc4random_uniform(31)/10;
    }
    
    return self;
}


#pragma mark - Accessors
- (NSSet<Course *> *)courses{
    return [_courses copy];
}

-(NSSet<Teacher *> *)teachers{
    return [_teachers copy];
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rMean Grade: %.1f\rCourses :%ld", self.meanGrade, _courses.count]];
}

- (void)singUpForCourse:(Course *)course{
    [_courses addObject:course];
}


#pragma mark - EducationalProcessParticipant
- (NSSet<id<EducationalProcessParticipant>> *)supers{
    return [_teachers copy];
}

- (void)addSuper:(id<EducationalProcessParticipant>)sup{
    [_teachers addObject:sup];
}

- (void)addSupers:(NSArray<id<EducationalProcessParticipant>> *)supers{
    [_teachers addObjectsFromArray:supers];
}

- (NSSet<id<EducationalProcessParticipant>> *)subs{
    return nil;
}

- (void)addSub:(id<EducationalProcessParticipant>)sub{
    NSLog(@"%s  %@", __func__, self);
    NSLog(@"Student can't have subs, operation will not make effect");
    
}

- (void)addSubs:(NSArray<id<EducationalProcessParticipant>> *)subs{
    NSLog(@"%s  %@", __func__, self);
    NSLog(@"Student can't have subs, operation will not make effect");
}


@end
