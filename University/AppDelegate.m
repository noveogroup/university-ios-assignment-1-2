//
//  AppDelegate.m
//  University
//
//  Created by Oleg Sannikov on 2/14/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "AppDelegate.h"

#import "Teacher.h"
#import "DepartmentChief.h"
#import "Student.h"
#import "Department.h"
#import "Course.h"

#import "DataManager.h"
#import "PersonGenerator.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self testModel];
    
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


#pragma mark - Private
- (void)testModel{
    PersonGenerator *generator = [PersonGenerator new];
    
    Department *mathDepartment = [Department departmentWithName:@"Math sciences"];{
        // Department Chief
        DepartmentChief *chief = [[DepartmentChief alloc] initWithPerson:[generator randomPerson]];{
            chief.salary = @50000;
            mathDepartment.chief = chief;
        }
        
        // Teachers
        Teacher *analysisTeacher = [[Teacher alloc] initWithPerson:[generator randomPerson]];
        Teacher *linearAlgebraTeacher = [[Teacher alloc] initWithPerson:[generator randomPerson]];
        
        // Courses
        Course *analysisCourse = [analysisTeacher startCourseWithName:@"Mathematical analysis"];
        Course *linearAlgebraCourse = [linearAlgebraTeacher startCourseWithName:@"Linear algebra"];
        Course *analyticalGeometry = [linearAlgebraTeacher startCourseWithName:@"Analytical geometry"];
        
        // Create students and assign courses
        NSMutableArray *students = [NSMutableArray new];{
            for (int i = 0; i < 10; i++) {
                [students addObject:[[Student alloc] initWithPerson:[generator randomPerson]]];
            }
            
            [analysisCourse addParticipants:students];
            for (int i = 0; i < students.count*0.5; i++) {
                [linearAlgebraCourse addParticipant:students[i]];
                [analyticalGeometry addParticipant:students[i]];
            }
        }
        
        [mathDepartment addEmployees:@[analysisTeacher, linearAlgebraTeacher]];
    }
    
    [[DataManager sharedManager] addDepartment:mathDepartment];
    
    NSLog(@"%@\r\rTeachers%@", mathDepartment, mathDepartment.teachers);
    
    NSLog(@"Mean Department Grade = %.1f", mathDepartment.meanGrade);
    mathDepartment.teachers.anyObject.courses.anyObject.participants.anyObject.meanGrade += 20;
    NSLog(@"Mean Department Grade = %.1f", mathDepartment.meanGrade);
    
    
    
}

@end
