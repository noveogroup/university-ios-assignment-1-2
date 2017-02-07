//
//  main.m
//  Lab1
//
//  Created by Admin on 14/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeportamentMember.h"
#import "Deportament.h"
#import "DeportamentDirector.h"
#import "StudentGroup.h"
#import "Student.h"
#import "University.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        University *university = [University sharedInstance];
        
        Deportament *histDeportament = [[Deportament alloc] init];
        [university addDeportament:histDeportament];
        DeportamentDirector *histDepDirector = [DeportamentDirector humanWithFullName:@"Vasia" age:[NSNumber numberWithInt:23]];
        StudentGroup *firstGroup = [[StudentGroup alloc] init];
        Student *student1 = [Student humanWithFullName:@"Olga" age:[NSNumber  numberWithInt:23]];
        Student *student2 = [Student humanWithFullName:@"Oleg" age:[NSNumber  numberWithInt:23]];
        
        [firstGroup addStudent:student1];
        [firstGroup addStudent:student2];

        [histDeportament addGroup:firstGroup];
        [histDeportament addTeacher:histDepDirector];
        [histDeportament setDeportamentDirector:histDepDirector];
        
        [student1 addNewGrade:[NSNumber numberWithFloat:4.5] subject:History];
        [student1 addNewGrade:[NSNumber numberWithFloat:3.9] subject:Mathematics];
        [student2 addNewGrade:[NSNumber numberWithFloat:2.5] subject:History];
        [student2 addNewGrade:[NSNumber numberWithFloat:5.0] subject:Mathematics];
        
        NSLog([NSString stringWithFormat: @"%f",firstGroup.studentsAvgGrade]);
        
        // If student parent want see avgGrade
        NSLog([NSString stringWithFormat: @"%f",student1.avgGrade]);
    }
    return 0;
}
