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
#import "Gender.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        // Create a University singleton-instance
        UniversitySingleton *myUniversity = [UniversitySingleton sharedInstance];
        
        // Crating a hellyeah-students
        
        Student *firstStudent = [[Student alloc]initStudenttWithFirstName:@"Wesley" 
                                                                 lastName:@"Geer"
                                                                      age:@(17)];
        [firstStudent setNickName:@"Westyle"];
        [firstStudent setAveragePoints:@(4.0)];

        Student *secondStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                  lastName:@"Abbott"
                                                                       age:@(19)];
        
        [secondStudent setNickName:@"Vinnie"];
        [secondStudent setAveragePoints:@(4.0)];
        
        Student *thirdStudent = [[Student alloc]initStudenttWithFirstName:@"Paul"
                                                                 lastName:@"Abbott"
                                                                      age:@(20)];
        
        [thirdStudent setNickName:@"Papa Heat"];
        [thirdStudent setAveragePoints:@(4.0)];

        
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
                                                                                 age:@(250)
                                                                              gender:humanGenderIsMale
                                                                          university:@"Darmstadt Technische Universitat"
                                                                          department:@"All Departments"
                                                                              salary:@(150000)
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
        [firstStudent setAveragePoints:@(4.5)];
        
        // Get student gender in string presentation
        NSLog(@"Gender of first student is:%@", [[[Gender descriptions]objectAtIndex:[firstStudent genderId]]description]);
  
    }
    return 0;
}

