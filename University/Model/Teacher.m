//
//  Teacher.m
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Teacher.h"
#import "Course.h"
#import "Student.h"

@interface Teacher (){
    NSMutableSet<Course *> *_courses;
}
@property (nonatomic, readwrite) float meanGrade;

@end

@implementation Teacher
#pragma mark - Liecycle
- (instancetype)init{
    self = [super init];
    if (self) {
        _courses = [NSMutableSet new];
    }
    
    return self;
}


#pragma mark - Accessors
- (NSSet<Course *> *)courses{
    return _courses;
}

- (NSSet<Student *> *)students{
    NSMutableSet *students = [NSMutableSet new];
    for (Course *course in _courses) {
        [students addObjectsFromArray:course.participants.allObjects];
    }
    
    return students;
}

#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rMean Grade: %.1f\rCourses :%ld\rStudents :%ld", self.meanGrade, _courses.count, self.students.count]];
}

- (Course *)startCourseWithName:(NSString *)name{
    Course *newCourse = [Course courseWithName:name andTeacher:self];
    
    newCourse.teacher = self;
    [_courses addObject:newCourse];
    [newCourse addObserver:self forKeyPath:@"meanGrade" options:NSKeyValueObservingOptionNew context:nil];
    [self recalculateMeanGrade];
    
    return newCourse;
}


#pragma mark - Private
- (void)recalculateMeanGrade{
    float meanGrade;
    for (Course * course in _courses) {
        meanGrade += course.meanGrade;
    }
    
    self.meanGrade = meanGrade/_courses.count;
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([object isKindOfClass:[Course class]]) {
        if ([keyPath isEqualToString:@"meanGrade"]) {
            [self recalculateMeanGrade];
        }
    }
}

@end
