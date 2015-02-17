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
#import "University.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSArray *students = [NSArray arrayWithObjects:
                             [[Student alloc] initStudentWithFirstName:@"Petr" lastName:@"Ivanov" age:@19 andAveragePoint:@4.2],
                             [[Student alloc] initStudentWithFirstName:@"Ivan" lastName:@"Petrov" age:@20 andAveragePoint:@4.5],
                             [[Student alloc] initStudentWithFirstName:@"Fedor" lastName:@"Anissimov" age:@18 andAveragePoint:@3.9],
                             [[Student alloc] initStudentWithFirstName:@"Maxim" lastName:@"Sidorov" age:@21 andAveragePoint:@4.8],
                             [[Student alloc] initStudentWithFirstName:@"Nikita" lastName:@"Shalakin" age:@20 andAveragePoint:@3.7],
                             [[Student alloc] initStudentWithFirstName:@"Artem" lastName:@"Valov" age:@21 andAveragePoint:@4.1],
                             [[Student alloc] initStudentWithFirstName:@"Ivan" lastName:@"Rabov" age:@19 andAveragePoint:@4.5],
                             nil];
        
        NSArray *teachers = [NSArray arrayWithObjects:
                             [[Teacher alloc] initTeacherWithFirstName:@"Vladimir" lastName:@"Sugupov" age:@43 andSalary:@35000],
                             [[Teacher alloc] initTeacherWithFirstName:@"Andrey" lastName:@"Churkin" age:@56 andSalary:@37000],
                             [[Teacher alloc] initTeacherWithFirstName:@"Viktor" lastName:@"Savin" age:@49 andSalary:@32000],
                             [[Teacher alloc] initTeacherWithFirstName:@"Nikolai" lastName:@"Albanov" age:@34 andSalary:@36000],
                             nil];
        
        NSArray *groups = [NSArray arrayWithObjects:
                           [[Group alloc] initWithName:@"AB-02"],
                           [[Group alloc] initWithName:@"AT-23"],
                           [[Group alloc] initWithName:@"AO-12"],
                           nil];
       
        NSArray *departments = [NSArray arrayWithObjects:
                               [[Department alloc] initWithName:@"SSOD"],
                               [[Department alloc] initWithName:@"AVT"],
                               nil];
        
        NSArray *heads = [NSArray arrayWithObjects:
                          [[HeadOfDepartment alloc] initTeacherWithFirstName:@"Boris" lastName:@"Britva" age:@62 andSalary:@43000],
                          [[HeadOfDepartment alloc] initTeacherWithFirstName:@"Alexandr" lastName:@"Kasper" age:@68 andSalary:@45000],
                          nil];
        
        
        [groups[0] addStudent:students[0]];
        [groups[0] addStudent:students[1]];
        [groups[0] addStudent:students[2]];
        [groups[1] addStudent:students[3]];
        [groups[1] addStudent:students[4]];
        [groups[2] addStudent:students[5]];
        [groups[2] addStudent:students[6]];
        
        [teachers[0] addGroup:groups[0]];
        [teachers[0] addGroup:groups[1]];
        [teachers[1] addGroup:groups[0]];
        [teachers[1] addGroup:groups[2]];
        [teachers[2] addGroup:groups[1]];
        [teachers[3] addGroup:groups[2]];
        
        [departments[0] addGroup:groups[0]];
        [departments[0] addGroup:groups[1]];
        [departments[0] addTeacher:teachers[0]];
        [departments[0] addTeacher:teachers[1]];
        [departments[0] addTeacher:teachers[2]];
        [departments[0] addHeadOfDepartment:heads[0]];
        
        [departments[1] addGroup:groups[2]];
        [departments[1] addTeacher:teachers[3]];
        [departments[1] addHeadOfDepartment:heads[1]];
        
        University *univer = [University sharedInstance];
        [univer addDepartment:departments[0]];
        [univer addDepartment:departments[1]];
        
        
        NSLog(@"Created:\n%@\n%@\n%@", students, teachers, heads);
        
        NSLog(@"Average Point of SSOD department: %@", [departments[0] departmentAveragePoint]);
        
        [students[0] changeAveragePoint:@4.5];  //проверка изменения среднего балла кафедры при изменениии среденего балла стулента
        
        NSLog(@"New Average Point of SSOD department: %@", [departments[0] departmentAveragePoint]);
        
        NSLog(@"All members of education process:\n%@\n%@\n%@", [univer headsOfDepartments], [univer teachers], [univer students]);
        
        return 0;
    }
}
