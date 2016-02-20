//
//  ViewController.m
//  University
//
//  Created by Vik on 12.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//




#import "ViewController.h"
#import "Rector.h"
#import "Student.h"
#import "Dean.h"
#import "University.h"
#import "DepartmentHead.h"
#import "UniversityEmployee.h"
#import "Teacher.h"
#import "EmployeeData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EmployeeData *eData = [EmployeeData sharedInstance];

    
    University *university = [[University alloc] init];
    
    Rector *rector = [[Rector alloc] init];
    
    [university addSubordinate:rector];
    
    Dean *dean1 = [[Dean alloc] init];
    Dean *dean2 = [[Dean alloc] init];
    [rector.subordinates addObjectsFromArray:@[dean1, dean2]];
    
    DepartmentHead *dHead1 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead2 = [[DepartmentHead alloc] init];
    NSString *depName = @"Computer Engineering";
    dHead1.departmentName = depName;
    [dean1.subordinates addObjectsFromArray:@[dHead1, dHead2]];
    
    DepartmentHead *dHead3 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead4 = [[DepartmentHead alloc] init];
    [dean2.subordinates addObjectsFromArray:@[dHead3, dHead4]];

    Teacher *t1 = [[Teacher alloc] init];
    Teacher *t2 = [[Teacher alloc] init];
    
    [dHead3 addSubordinate:t1];
    [dHead4 addSubordinate:t2];

    for (int i = 0; i < 5; i++) {
        Student *stud = [[Student alloc] init];
        stud.departmentName = depName;
        [t1 addSubordinate:stud];
    }
    NSLog(@"\n\n\nUniversity subordinates --------------------------------------------\n\n");

    [university getSubordinatesList];
    
    NSLog(@"\n\n\nDean subordinates --------------------------------------------\n\n");
    
    [dean2 getSubordinatesList];
    
    Student *stud = [[Student alloc] init];
    
    NSLog(@"\n\n\nStudent detail info --------------------------------------------\n\n");
    NSLog(@"%@\n", [stud detailedDescription]);
    
    NSLog(@"\n\n\nTeacher detail info --------------------------------------------\n\n");
    NSLog(@"%@\n", [t1 detailedDescription]);
    

    NSLog(@"\n\n\nGet info from singleton --------------------------------------------\n\n");
    NSLog(@"%@", eData.subjects);
    
    
    [dean2 getSubordinatesList];
    NSLog(@"\v");
    
    Student *student1 = [[Student alloc] init];
    Student *student2 = [[Student alloc] init];
    NSLog(@"%@ is created \n", [student1 description]);
    NSLog(@"%@ is created \n\n", [student2 description]);
    [t1 addSubordinate:student1];
    student1.departmentName = depName;
    [t2 addSubordinate:student2];
    
    NSLog(@"\n\n\nChange %@ %@ GPA --------------------------------------------\n\n", student1.firstName, student1.lastName);
    [student1 changeGPAtoNewGPA:3.56 withIdentifier:student1.departmentName];
    
    [dean2 getSubordinatesList];
    
    [eData clear];
    
    NSLog(@"\n\n\nAutogenerate University subordinates --------------------------------------------\n\n");
    University *university2 = [[University alloc] init];
    [university2 generateUniversityEmployees];
    [university2 getSubordinatesList];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
