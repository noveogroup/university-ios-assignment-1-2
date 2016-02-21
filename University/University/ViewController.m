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
    
    [rector addSubordinate:dean1];
    [rector addSubordinate:dean2];
    
    DepartmentHead *dHead1 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead2 = [[DepartmentHead alloc] init];
    NSString *depName = @"Computer Engineering";
    dHead1.departmentName = depName;
    
    [dean1 addSubordinate:dHead1];
    [dean1 addSubordinate:dHead2];
    
    DepartmentHead *dHead3 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead4 = [[DepartmentHead alloc] init];
    
    [dean2 addSubordinate:dHead3];
    [dean2 addSubordinate:dHead4];

    Teacher *t1 = [[Teacher alloc] init];
    Teacher *t2 = [[Teacher alloc] init];
    
    [dHead3 addSubordinate:t1];
    [dHead4 addSubordinate:t2];

    for (int i = 0; i < 5; i++) {
        Student *stud = [[Student alloc] init];
        stud.departmentName = depName;
        [t1 addSubordinate:stud];
    }
    NSLog(@"\vUniversity subordinates:\n\n");

    [university getSubordinatesList];
    
    NSLog(@"\vDean subordinates:\n\n");
    
    [dean2 getSubordinatesList];
    
    Student *stud = [[Student alloc] init];
    
    NSLog(@"\vStudent detail info:\n\n");
    NSLog(@"%@\n", [stud detailedDescription]);
    
    NSLog(@"\vTeacher detail info:\n\n");
    NSLog(@"%@\n", [t1 detailedDescription]);
    

    NSLog(@"\vGet info from singleton:\n\n");
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
    
    NSLog(@"\vChange %@ %@ GPA:\n\n", student1.firstName, student1.lastName);
    [student1 changeGPAtoNewGPA:3.56 withIdentifier:student1.departmentName];
    
    [dean2 getSubordinatesList];
    
    [eData clear];
    
    NSLog(@"\vAutogenerate University subordinates:\n\n");
    University *university2 = [[University alloc] init];
    [university2 generateUniversityEmployees];
    [university2 getSubordinatesList];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
