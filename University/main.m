//
//  main.m
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Header.h"

int main(int argc, char *argv[])
{
    // Test university: Novosibirsk State University
    University *NSU = [[University alloc] initWithName:@"NSU"];
    
    // Test departments
    Faculty *facIT = [[Faculty alloc] initWithName:@"Information technologies" andUniversity:NSU];
    /*
    Faculty *facP = [[Faculty alloc] initWithName:@"Physic" andUniversity:NSU];
     */
    
    // Test cathedrals
    Cathedral *cathCS = [[Cathedral alloc] initWithName:@"Computing Systems" andFaculty:facIT];
    /*
    Cathedral *cathPC = [[Cathedral alloc] initWithName:@"Parallel Calculating" andFaculty:facIT];
    Cathedral *cathKM = [[Cathedral alloc] initWithName:@"Quanting Mechanic" andFaculty:facP];
     */
    
    // Test groups
    Group *g12203 = [[Group alloc] initWithName:@"Group 12203" andCathedral:cathCS];
    /*
    Group *g12201 = [[Group alloc] initWithName:@"Group 12201" andCathedral:cathPC];
    Group *g12202 = [[Group alloc] initWithName:@"Group 12202" andCathedral:cathPC];
    Group *g12401 = [[Group alloc] initWithName:@"Group 12401" andCathedral:cathKM];
     */
    
    // Test students
    Student *student1 = [[Student alloc] initWithName:@"Ivan Bukshev" andBirthday:@"10/08/1995" andGroup:g12203];
    Student *student2 = [[Student alloc] initWithName:@"Ruslan Pogodin" andBirthday:@"21/09/1994" andGroup:g12203];
    /*
    Student *student3 = [[Student alloc] initWithName:@"Roman Rau" andBirthday:@"06/08/1995" andGroup:g12201];
    Student *student4 = [[Student alloc] initWithName:@"Alexander Zholus" andBirthday:@"14/06/1996" andGroup:g12201];
    Student *student5 = [[Student alloc] initWithName:@"Nikolay Glushakov" andBirthday:@"17/01/1994" andGroup:g12203];
    Student *student6 = [[Student alloc] initWithName:@"Vladimir Shabanov" andBirthday:@"21/12/1995" andGroup:g12202];
    Student *student7 = [[Student alloc] initWithName:@"Gleb Baranov" andBirthday:@"20/11/1994" andGroup:g12202];
    Student *student8 = [[Student alloc] initWithName:@"Ivan Ivanov" andBirthday:@"12/04/1993" andGroup:g12203];
    Student *student9 = [[Student alloc] initWithName:@"Ivan Shmakov" andBirthday:@"05/02/1994" andGroup:g12202];
    Student *student10 = [[Student alloc] initWithName:@"Alexander Byzhov" andBirthday:@"16/08/1994" andGroup:g12401];
    Student *student11 = [[Student alloc] initWithName:@"Alexander Minakov" andBirthday:@"24/10/1994" andGroup:g12203];
     */
    
    // Test subjects
    Subject *subjMath = [[Subject alloc] initWithName:@"Math"];
    Subject *subjRussian = [[Subject alloc] initWithName:@"Russian"];
    Subject *subjLangC = [[Subject alloc] initWithName:@"Language C"];
    Subject *subjPhysics = [[Subject alloc] initWithName:@"Physics"];
    /*
     Subject *subjEnglish = [[Subject alloc] initWithName:@"English"];
     */
    
    // Create a diary for each student
    Diary *diary1 = [[Diary alloc] initWithOwner:student1];
    Diary *diary2 = [[Diary alloc] initWithOwner:student2];
    /*
    Diary *diary3 = [[Diary alloc] initWithOwner:student3];
    Diary *diary4 = [[Diary alloc] initWithOwner:student4];
    Diary *diary5 = [[Diary alloc] initWithOwner:student5];
    Diary *diary6 = [[Diary alloc] initWithOwner:student6];
    Diary *diary7 = [[Diary alloc] initWithOwner:student7];
    Diary *diary8 = [[Diary alloc] initWithOwner:student8];
    Diary *diary9 = [[Diary alloc] initWithOwner:student9];
    Diary *diary10 = [[Diary alloc] initWithOwner:student10];
    Diary *diary11 = [[Diary alloc] initWithOwner:student11];
    */
    
    // Add some subjects to first two diaries
    [diary1 addSubject:subjMath];
    [diary1 addSubject:subjRussian];
    [diary2 addSubject:subjMath];
    [diary2 addSubject:subjLangC];
    
    // Add some marks to first two diaries
    [diary1 setMark:5 toSubject:subjMath];
    [diary2 setMark:4 toSubject:subjMath];
    [diary2 setMark:3 toSubject:subjPhysics];
    
    // Create observer
    Observer *obs = [Observer sharedInstance];
    
    NSLog(@"Student name: %@", [student1 name]);
    NSLog(@"Math: %f", [[student1 diary] getAverageMarkOfSubject:subjMath]);
    NSLog(@"Russian: %f", [[student1 diary] getAverageMarkOfSubject:subjRussian]);
    NSLog(@"All subjects: %f", [[student1 diary] getAverageMarkOfAllSubjects]);
    NSLog(@"Student name: %@", [student2 name]);
    NSLog(@"Math: %f", [[student2 diary] getAverageMarkOfSubject:subjMath]);
    NSLog(@"Language C: %f", [[student2 diary] getAverageMarkOfSubject:subjPhysics]);
    NSLog(@"All subjects: %f", [[student2 diary] getAverageMarkOfAllSubjects]);
    
    // Show average mark on cathedral
    NSLog(@"Average mark on Cathedral: %f", [obs getAverageMarkOfCathedral:cathCS]);
    
    return NSApplicationMain(argc, (const char **)argv);
}
