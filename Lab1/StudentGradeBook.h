//
//  StudentGradeBook.h
//  Lab1
//
//  Created by Admin on 16/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Subject
{
    History = 1,
    Mathematics = 2
} Subject;

@interface StudentGradeBook : NSObject

-(void) addGrade:(NSNumber*) grade
         subject:(Subject) subject;

-(float) calculateAvgGrade;

@end
