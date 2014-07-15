//
//  main.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Specialist.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        // Crating a hellyeah-students
        
        Student *firstStudent = [[Student alloc]initStudentWith:@"Wesley" :@"Geer" :@"Westyle" :[NSNumber numberWithInt:17] :humanGenderIsMale :nil :nil :[NSNumber numberWithFloat:4.7]];
        Student *secondStudent = [[Student alloc]initStudentWith:@"Paul" :@"Abbott" :@"Vinnie" :[NSNumber numberWithInt:19] :humanGenderIsMale :nil :nil :[NSNumber numberWithFloat:4.0]];
        Student *thirdStudent = [[Student alloc]initStudentWith:@"James" :@"Heatfield" :@"Papa Heat" :[NSNumber numberWithInt:22] :humanGenderIsMale :nil :nil :[NSNumber numberWithFloat:3.5]];
        
        // Creating a powerful Specialists
        
        Specialist *firstSpecialist = [[Specialist alloc]initSpicialistWith:@"Bob" :@"Dylan" :@"Old Bobby" :[NSNumber numberWithInt:70]:humanGenderIsMale :nil :@"Department of Rock and Roll" :[NSNumber numberWithInt:100000] :memberDegreeSeniorLecturerDegree];
        Specialist *secondSpecialist = [[Specialist alloc]initSpicialistWith:@"Darrell" :@"Abbott" :@"Dimebag" :[NSNumber numberWithInt:250]:humanGenderIsMale :nil :@"Department of BlackJack and Whores" :[NSNumber numberWithInt:150000] :memberDegreeHeadOfDepartmentDegree];
        Specialist *thirdSpecialist = [[Specialist alloc]initSpicialistWith:@"Wolfgang" :@"Mozart" :@"Amadeus" :[NSNumber numberWithInt:250]:humanGenderIsMale :@"Darmstadt Technische Universitat" :@"All Departments" :[NSNumber numberWithInt:150000] :memberDegreeRectorDegree];
        
        // Set all students like a slaves for a first specialist
        NSMutableArray *allStudents = [[NSMutableArray alloc]initWithObjects:firstStudent, secondStudent, thirdStudent, nil];
        [firstSpecialist setSubordinatesList:allStudents];
        // Set first specialist as a Chief for all 3 students
        for (Student *currentStudent in allStudents) {
            [currentStudent setChief:firstSpecialist];
        }
        // Set second specialist like a chief for first specialist
        [firstSpecialist setChief:thirdSpecialist];
        // Set third specialist like a chief for second specialist
        [secondSpecialist setChief:thirdSpecialist];
        
        // So who is Big Boss in this little fun place?
        NSArray *allSpecialists = [NSArray arrayWithObjects:firstSpecialist, secondSpecialist, thirdSpecialist, nil];
        for (Specialist *currentSpec in allSpecialists) {
            if ([currentSpec degree]==memberDegreeRectorDegree) {
                NSLog(@"Rector of %@ is: %@ \"%@\" %@", [currentSpec departmentName], [currentSpec firstName], [currentSpec nickName], [currentSpec lastName]);
                NSLog(@"He has next nearest subordinates:");
                for (Human *currentSub in [currentSpec subordinatesList]) {
                    NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
                }
            }
        }
        
        
        NSLog(@"University is: %@", [firstStudent universityName]);
        NSLog(@"Department is: %@", [firstStudent departmentName]);
        
        // Remove one student and check the Amadeus subordinates list
        NSLog(@"After removing secondStudent, thirdSpecialist has next subordinates:");
        [secondStudent removeChief];
        for (Human *currentSub in [thirdSpecialist subordinatesList]) {
            NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
        }
        
        NSLog(@"Students that subordinates to firstSpecialist");
        // Remove one specialist and check the Amadeus subordinates list
        [firstSpecialist removeChief];
        for (Human *currentSub in [firstSpecialist subordinatesList]) {
            NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
        }
        
        // And finally description for Amadeus
        NSLog(@"%@", [thirdSpecialist description]);

    }
    return 0;
}

