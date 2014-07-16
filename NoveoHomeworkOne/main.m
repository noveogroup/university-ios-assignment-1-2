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
        
        Student *firstStudent = [[Student alloc]initStudenttWithFirstName:@"Wesley" 
                                                                 lastName:@"Geer"
                                                                      age:[NSNumber numberWithInt:17]];
        [firstStudent setNickName:@"Westyle"];
        [firstStudent setAveragePoints:[NSNumber numberWithFloat:4.7]];

        Student *secondStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                  lastName:@"Abbott"
                                                                       age:[NSNumber numberWithInt:19]];
        
        [secondStudent setNickName:@"Vinnie"];
        [secondStudent setAveragePoints:[NSNumber numberWithFloat:4.3]];
        
        Student *thirdStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                 lastName:@"Abbott"
                                                                      age:[NSNumber numberWithInt:19]];
        
        [thirdStudent setNickName:@"Papa Heat"];
        [thirdStudent setAveragePoints:[NSNumber numberWithFloat:4.5]];

        
        // Creating a powerful Specialists
        
        Specialist *firstSpecialist = [[Specialist alloc]initSpecialistWithFirstName:@"Bob"
                                                                            lastName:@"Dylan"
                                                                              degree:memberDegreeSeniorLecturerDegree
                                                                          department:@"Department of Rock'n'Roll"];
        Specialist *secondSpecialist = [[Specialist alloc]initSpecialistWithFirstName:@"Darrell"
                                                                             lastName:@"Abbott"
                                                                               degree:memberDegreeLecturerDegree
                                                                           department:@"Department of BlackJack and Whores"];
 
        Specialist *thirdSpecialist = [[Specialist alloc]initSpecialistWithFirstName:@"Wolfgang"
                                                                            lastName:@"Mozart"
                                                                            nickName:@"Amadeus"
                                                                                 age:[NSNumber numberWithInt:250]
                                                                              gender:humanGenderIsMale
                                                                          university:@"Darmstadt Technische Universitat"
                                                                          department:@"All Departments"
                                                                              salary:[NSNumber numberWithInt:150000]
                                                                              degree:memberDegreeRectorDegree];

        
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

