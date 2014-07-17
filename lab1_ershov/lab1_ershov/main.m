//
//  main.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Student.h"
#import "Teacher.h"
#import "Group.h"
#import "Department.h"
#import "DataController.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *students = [NSArray arrayWithObjects:
                [[Student alloc] initWithName:@"Alex"
                               BirthdayString:@"07/01/1994"],
                [[Student alloc] initWithName:@"Bob"
                               BirthdayString:@"02/02/1992"],
                [[Student alloc] initWithName:@"Sigismund"
                               BirthdayString:@"04/14/1992"],
                [[Student alloc] initWithName:@"Emma"
                               BirthdayString:@"03/23/1993"],
                [[Student alloc] initWithName:@"John"
                               BirthdayString:@"07/17/1994"],
                [[Student alloc] initWithName:@"Maria"
                               BirthdayString:@"06/06/1991"],
                [[Student alloc] initWithName:@"Julia"
                               BirthdayString:@"05/15/1994"],
                [[Student alloc] initWithName:@"Abraham"
                               BirthdayString:@"08/23/1994"],
                [[Student alloc] initWithName:@"Geralt"
                               BirthdayString:@"09/19/1990"],
                [[Student alloc] initWithName:@"Triss"
                               BirthdayString:@"10/20/1989"],
                [[Student alloc] initWithName:@"Jennifer"
                               BirthdayString:@"12/23/1993"],
                [[Student alloc] initWithName:@"Leto"
                               BirthdayString:@"11/21/1992"],
                [[Student alloc] initWithName:@"Zoltan"
                               BirthdayString:@"12/22/1992"],
                [[Student alloc] initWithName:@"Vernon"
                               BirthdayString:@"01/11/1991"],
                nil
        ];

        // Groups
        NSArray *groups = [NSArray arrayWithObjects:
                [[Group alloc] initWithName:@"1201"],
                [[Group alloc] initWithName:@"1202"],
                [[Group alloc] initWithName:@"2201"],
                [[Group alloc] initWithName:@"2202"],
                nil
        ];

        // Departments
        NSArray *departments = [NSArray arrayWithObjects:
                [[Department alloc] initWithName:@"Information Technology"],
                [[Department alloc] initWithName:@"Wizardry and Witchcraft"],
                nil
        ];

        // add groups to departments
        Department *tempDepartment = [departments objectAtIndex:0];
        [tempDepartment addGroup:[groups objectAtIndex:0]];
        [tempDepartment addGroup:[groups objectAtIndex:1]];

        tempDepartment = [departments objectAtIndex:1];
        [tempDepartment addGroup:[groups objectAtIndex:2]];
        [tempDepartment addGroup:[groups objectAtIndex:3]];

        // add random marks to all students, and
        // add students to groups
        for (Student *student in students) {
            for (int i = 0; i < 7; ++i) {
                int randomMark = arc4random_uniform(6);
                [student addMark:randomMark];
            }
            [[groups objectAtIndex:[students indexOfObject:student] % 4] addStudent:student];
        }

        DataController *dataController = [DataController sharedInstance];

        for (Department *department in departments) {
            [dataController addDepartment:department];
        }

        for (Department *department in dataController.departments) {
            NSLog(@"%@", [department description]);
        }

    }
    return 0;
}

