//
//  Deportament.m
//  Lab1
//
//  Created by Admin on 15/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deportament.h"
#import "StudentGroup.h"

@interface  Deportament()

@property (nonatomic, weak) DeportamentMember *director;
@property (nonatomic) NSMutableSet *groups;
@property (nonatomic) NSMutableSet *teachers;

@end

@implementation Deportament

-(void) addGroup:(StudentGroup *)group{
    
    if (!self.groups)
        self.groups = [[NSMutableSet alloc] init];
    
    [self.groups addObject:group];
}

-(float) getAvgGradeByStudents{
    
    float result;
    
    if ([self.groups count] != 0){
        
        for (StudentGroup *group in self.groups){
            result += group.studentsAvgGrade;
        }
        result = result / [self.groups count];
    }
    return result;
}

-(void) setDeportamentDirector:(DeportamentDirector *)depDirector{
    
    _director = depDirector;
}

-(void) addTeacher:(DeportamentMember *)teacher{
    
    if (!self.teachers)
        self.teachers = [[NSMutableSet alloc] init];
    
    [self.teachers addObject:teacher];
}

@end
