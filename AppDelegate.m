//
//  AppDelegate.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "AppDelegate.h"
#import "ADHuman.h"
#import "ADHead.h"
#import "ADStudent.h"
#import "ADProfessor.h"
#import "ADHeadOfDepartment.h"
#import "ParticipantLearningProcessProtocol.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    ADHuman* human1 = [[ADHuman alloc] init];
    human1.name = @"Wasya wasiliev human";
    human1.age = 25;
    
    
    ADHead* head1 = [[ADHead alloc] init];
    head1.name = @"Artem Vasilievich";
    head1.age = 50;
    head1.salary = 20000;
    head1.listOfProfessors;
    head1.listOfStudents;
    head1.listOfSubjects;
    head1.listOfSubordinates;
    
    
    
    ADStudent* student1 = [[ADStudent alloc] init];
    student1.name = @"Kolya Pupkin";
    student1.age = 21;
    student1.averageScore;
    student1.nameOfUniversity;
    student1.amountOfYearsAtUniversity;
    
    
    ADProfessor* professor1 = [[ADProfessor alloc]init];
    professor1.name = @"Ivan Dmitrievich";
    professor1.age = 45;
    professor1.salary = 25000;
    professor1.listOfStudents;
    professor1.listOfSubjects;
    professor1.nameOfUniversity;
    professor1.amountOfYearsAtUniversity;
    

    NSMutableArray* array = [[NSMutableArray alloc] initWithObjects:human1,
                             head1,
                             student1,
                             professor1,
                             nil];
    
    ADHeadOfDepartment* headOfDep1 = [[ADHeadOfDepartment alloc]init];
    headOfDep1.name = @"Oleg Konstantinovich";
    headOfDep1.age = 66;
    headOfDep1.salary = 50000;
    headOfDep1.listOfStudents;
    headOfDep1.listOfSubjects;
    headOfDep1.nameOfUniversity;
    headOfDep1.amountOfYearsAtUniversity;
    headOfDep1.listOfSubordinates;
    headOfDep1.listOfProfessors;
    
   
    
    [array addObject:headOfDep1];
    
    
   
    
    for (id <ParticipantLearningProcessProtocol> memberOfLearningProc in array ) {
        
        
        ADHuman* obj = (ADHuman*) memberOfLearningProc;
        if ([memberOfLearningProc isKindOfClass:[ADHuman class]]) {
            NSLog(@"my name is - %@", obj.name);
        }
        ADHead* objHead = (ADHead*) memberOfLearningProc;
        if ([memberOfLearningProc isKindOfClass:[ADHead class]]) {
            NSLog(@"my salary is - %f", objHead.salary);
        }
        
        
        if ([memberOfLearningProc conformsToProtocol:@protocol(ParticipantLearningProcessProtocol)] ) {
        
            [memberOfLearningProc haveBreak];
            [memberOfLearningProc session];
            
        if ([memberOfLearningProc respondsToSelector:@selector(haveGradebook)]) {
            [memberOfLearningProc haveGradebook];
          }
        
        if ([memberOfLearningProc respondsToSelector:@selector(passExams)]) {
           [memberOfLearningProc passExams];
        
        }
       
        if ([memberOfLearningProc respondsToSelector:@selector(takeExams)]) {
            [memberOfLearningProc takeExams];
            }
            
        if ([memberOfLearningProc respondsToSelector:@selector(giveLecture)]) {
                [memberOfLearningProc giveLecture];
            }
            
        if ([memberOfLearningProc respondsToSelector:@selector(listenLecture)]) {
                [memberOfLearningProc listenLecture];
                
            }
            
        if ([memberOfLearningProc respondsToSelector:@selector(goToLibrary)]) {
                [memberOfLearningProc goToLibrary];
            }
            
        if ([memberOfLearningProc respondsToSelector:@selector(diplomaProdgect)]) {
                [memberOfLearningProc diplomaProdgect];
            }

        } else {
            
            NSLog(@"You are not a Participant Learning Process!!!!");
        }
    }
return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
