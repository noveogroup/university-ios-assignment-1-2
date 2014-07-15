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
        
        Student *firstStudent = [[Student alloc]initStudentWith:@"Wesley" :@"Geer" :@"Westyle" :[NSNumber numberWithInt:17] :[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"Department of Rock and Roll" :[NSNumber numberWithFloat:4.7]];
        Student *secondStudent = [[Student alloc]initStudentWith:@"Paul" :@"Abbott" :@"Vinnie" :[NSNumber numberWithInt:19] :[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"Department of Rock and Roll" :[NSNumber numberWithFloat:4.0]];
        Student *thirdStudent = [[Student alloc]initStudentWith:@"James" :@"Heatfield" :@"Papa Heat" :[NSNumber numberWithInt:22] :[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"Department of Rock and Roll" :[NSNumber numberWithFloat:3.5]];
        
        // Creating a powerful Specialists
        
        Specialist *firstSpecialist = [[Specialist alloc]initSpicialistWith:@"Bob" :@"Dylan" :@"Old Bobby" :[NSNumber numberWithInt:70]:[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"Department of Rock and Roll" :[NSNumber numberWithInt:100000] :[NSNumber numberWithInt:kSeniorLecturerDegree]];
        Specialist *secondSpecialist = [[Specialist alloc]initSpicialistWith:@"Darrell" :@"Abbott" :@"Dimebag" :[NSNumber numberWithInt:250]:[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"Department of Rock and Roll" :[NSNumber numberWithInt:150000] :[NSNumber numberWithInt:kHeadOfDepartmentDegree]];
        Specialist *thirdSpecialist = [[Specialist alloc]initSpicialistWith:@"Wolfgang" :@"Mozart" :@"Amadeus" :[NSNumber numberWithInt:250]:[NSNumber numberWithInt:kHumanGenderIsMale] :@"Darmstadt Technische Universitat" :@"All Departments" :[NSNumber numberWithInt:150000] :[NSNumber numberWithInt:kRectorDegree]];
        
        // Set all students like a slaves for a first specialist
        NSMutableArray *allStudents = [[NSMutableArray alloc]initWithObjects:firstStudent, secondStudent, thirdStudent, nil];
        [firstSpecialist setSubordinatesList:allStudents];
        // Set first specialist as a Chief for all 3 students
        for (Student *currentStudent in allStudents) {
            [currentStudent setChief:firstSpecialist];
        }
        // Set second specialist like a chief for first specialist
        [firstSpecialist setChief:secondSpecialist];
        // Set third specialist like a chief for second specialist
        [secondSpecialist setChief:thirdSpecialist];
        
        // So who is Big Boss in this little fun place?
        NSArray *allSpecialists = [NSArray arrayWithObjects:firstSpecialist, secondSpecialist, thirdSpecialist, nil];
        for (Specialist *currentSpec in allSpecialists) {
            if ([[currentSpec degree]intValue]==kRectorDegree) {
                NSLog(@"Rector of %@ is: %@ \"%@\" %@", [currentSpec departmentName], [currentSpec firstName], [currentSpec nickName], [currentSpec lastName]);
                NSLog(@"He has next subordinates:");
                for (Human *currentSub in [currentSpec subordinatesList]) {
                    NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
                }
            }
        }
        
        // Remove one student and check the Amadeus subordinates list
        [secondStudent removeChief];
        for (Human *currentSub in [thirdSpecialist subordinatesList]) {
            NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
        }
        
        // Remove one specialist and check the Amadeus subordinates list
        [firstSpecialist removeChief];
        for (Human *currentSub in [thirdSpecialist subordinatesList]) {
            NSLog(@"%@ \"%@\" %@",[currentSub firstName], [currentSub nickName], [currentSub lastName]);
        }
        
        // And finally description for Amadeus
        NSLog(@"%@", [thirdSpecialist description]);

    }
    return 0;
}

