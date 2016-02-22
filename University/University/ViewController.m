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
    
    eData.university = university;
    
    Rector *rector = [[Rector alloc] init];
    [university addSubordinate:rector];
    [eData addObj:rector];
    
    Dean *dean1 = [[Dean alloc] init];
    Dean *dean2 = [[Dean alloc] init];
    
    [rector addSubordinate:dean1];
    [rector addSubordinate:dean2];
    
    dean1.boss = dean2.boss = rector;
    
    [eData addObj:dean1];
    [eData addObj:dean2];
    
    DepartmentHead *dHead1 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead2 = [[DepartmentHead alloc] init];
    
    [dean1 addSubordinate:dHead1];
    [dean1 addSubordinate:dHead2];
    
    dHead1.boss = dHead2.boss = dean1;
    
    DepartmentHead *dHead3 = [[DepartmentHead alloc] init];
    DepartmentHead *dHead4 = [[DepartmentHead alloc] init];
    
    [dean2 addSubordinate:dHead3];
    [dean2 addSubordinate:dHead4];
    
    dHead3.boss = dHead4.boss = dean2;

    [eData addObj:dHead1];
    [eData addObj:dHead2];
    [eData addObj:dHead3];
    [eData addObj:dHead4];
    
    Teacher *t1 = [[Teacher alloc] init];
    Teacher *t2 = [[Teacher alloc] init];
    
    [dHead3 addSubordinate:t1];
    [dHead4 addSubordinate:t2];
   
    t1.boss = dHead3;
    t2.boss = dHead4;
    
    [eData addObj:t1];
    [eData addObj:t1];
    

    for (int i = 0; i < 5; i++) {
        Student *stud = [[Student alloc] init];
        [t1 addSubordinate:stud];
        [eData addObj:stud];
        stud.boss = t1;
    }
    
    
    
    NSLog(@"\v\vUniversity subordinates:\n\n");

    [university getSubordinatesList];

    NSLog(@"\v\vDean subordinates:\n\n");
    
    [dean2 getSubordinatesList];

    Student *stud = [[Student alloc] init];
    
    NSLog(@"\v\vStudent detail info:\n\n");
    NSLog(@"%@\n", [stud detailedDescription]);
    
    NSLog(@"\v\vTeacher description:\n\n");
    NSLog(@"%@\n", t1);
    
    NSLog(@"\v\vGet info from singleton:\n\n");
    NSLog(@"%@", eData.employees);

    Student *student1 = [[Student alloc] init];
    Student *student2 = [[Student alloc] init];
    
    NSLog(@"%@ is created \n", student1);
    NSLog(@"%@ is created \n\n", student2);
    
    [t1 addSubordinate:student1];
    
    student1.boss = t1;
    
    [t2 addSubordinate:student2];
    
    student2.boss = t1;

    [eData addObj:student1];
    [eData addObj:student2];
    
    [eData observing];
    
    NSLog(@"Old GPA of Department - %.2f", [university getOverallGPAOfDepartmentWithBoss:dHead3]);

    student1.GPA = 2.3;

    
  
    [eData reset];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
