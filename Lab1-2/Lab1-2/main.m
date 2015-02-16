//
//  main.m
//  Lab1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"
#import "Department.h"
#import "Student.h"
#import "Teacher.h"
#import "HeadOfDepartment.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSArray *students = [NSArray arrayWithObjects:
                             [[Student alloc] initStudentWithFirstName:@"Petr" lastName:@"Ivanov" age:@19 andAveragePoint:@4.2],
                             [[Student alloc] initStudentWithFirstName:@"Ivan" lastName:@"Petrov" age:@20 andAveragePoint:@4.5],
                             [[Student alloc] initStudentWithFirstName:@"Fedor" lastName:@"Anissimov" age:@18 andAveragePoint:@3.9],
                             nil];
        NSArray *teachers = [NSArray arrayWithObjects:
                             [[Teacher alloc] initTeacherWithFirstName:@"Vladimir" lastName:@"Sugupov" age:@43 andSalary:@35000],
                             [[Teacher alloc] initTeacherWithFirstName:@"Andrey" lastName:@"Churkin" age:@56 andSalary:@37000],
                             nil];
        
        NSArray *groups = [NSArray arrayWithObjects:
                           [[Group alloc] initWithName:@"AB-02"],
                           [[Group alloc] initWithName:@"AT-23"],
                           nil];
       
        NSArray *departments = [NSArray arrayWithObjects:
                               [[Department alloc] initWithName:@"SSOD"],
                               [[Department alloc] initWithName:@"AVT"],
                               nil];
        
        HeadOfDepartment *head = [[HeadOfDepartment alloc] initTeacherWithFirstName:@"Boris" lastName:@"Britva" age:@62 andSalary:@43000];
        
        [groups[0] addStudent:students[0]];
        [groups[0] addStudent:students[1]];
        [groups[0] addStudent:students[2]];
        
        [teachers[0] addGroup:groups[0]];
        [teachers[1] addGroup:groups[0]];
        
        [departments[0] addGroup:groups[0]];
        [departments[0] addTeacher:teachers[0]];
        [departments[0] addTeacher:teachers[1]];
        [departments[0] addHeadOfDepartment:head];
        
        

        
        
        
        NSLog(@"Created:\n%@\n%@\n%@", students, teachers, head);
        return 0;
    }
}
