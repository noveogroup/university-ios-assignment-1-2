//
//  ADHead.h
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADHuman.h"

@interface ADHead : ADHuman

@property(assign, nonatomic) CGFloat salary;

@property(assign, nonatomic) NSArray* listOfSubordinates; //подчиненные
@property(assign, nonatomic) NSArray* listOfStudents;
@property(assign, nonatomic) NSArray* listOfProfessors;
@property(assign, nonatomic) NSArray* listOfSubjects;


@end
