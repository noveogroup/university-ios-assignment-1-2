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
#import "UniversitySingleton.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        // Create a University singleton-instance
        UniversitySingleton *myUniversity = [UniversitySingleton sharedInstance];
        
        // Crating a hellyeah-students
        
        Student *firstStudent = [[Student alloc]initStudenttWithFirstName:@"Wesley" 
                                                                 lastName:@"Geer"
                                                                      age:[NSNumber numberWithInt:17]];
        [firstStudent setNickName:@"Westyle"];
        [firstStudent setAveragePoints:[NSNumber numberWithFloat:4.0]];

        Student *secondStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                  lastName:@"Abbott"
                                                                       age:[NSNumber numberWithInt:19]];
        
        [secondStudent setNickName:@"Vinnie"];
        [secondStudent setAveragePoints:[NSNumber numberWithFloat:4.0]];
        
        Student *thirdStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                 lastName:@"Abbott"
                                                                      age:[NSNumber numberWithInt:19]];
        
        [thirdStudent setNickName:@"Papa Heat"];
        [thirdStudent setAveragePoints:[NSNumber numberWithFloat:4.0]];

        
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

        
        // Set First and Second students like a subordinates for First Specialist
        [firstStudent setChief:firstSpecialist];
        [secondStudent setChief:firstSpecialist];
       
        // Set Third student like a suburdinate for Second Specialist
        [thirdStudent setChief:secondSpecialist];
        
        // Set First specialist like a subordinate for Third specialist
        [firstSpecialist setChief:thirdSpecialist];
        // Set Second specialist like a subordinate for Third specialist
        [secondSpecialist setChief:thirdSpecialist];
        
        
        // Set thirdSpecialist like a University Boss
        [myUniversity setHeadOfUniversity:thirdSpecialist];
        
        // Set delegate for the firstStudent
        [firstStudent setDelegate:myUniversity];
        
        // Check working the delegate method when student changed average points
        [firstStudent setAveragePoints:[NSNumber numberWithFloat:4.5]];
        
        /*
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
         */

    }
    return 0;
}

