//
//  StudentGradeBook.m
//  Lab1
//
//  Created by Admin on 16/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "StudentGradeBook.h"

@interface StudentGradeBook ()

    @property (nonatomic, strong) NSMutableDictionary *subjectsGrade;

@end

@implementation StudentGradeBook

-(void) addGrade:(NSNumber*)grade subject:(Subject)subject{
    
    if (self.subjectsGrade == nil)
        self.subjectsGrade = [[NSMutableDictionary alloc] init];
    
    [self.subjectsGrade setObject:grade forKey: [NSString stringWithFormat:@"%d",subject]];
    
    
}

-(float) calculateAvgGrade{
    
    float result;
    
    if (self.subjectsGrade != nil && [self.subjectsGrade count] != 0){
        for (id subject in self.subjectsGrade)
            result += [[self.subjectsGrade objectForKey:subject] floatValue];
    }
    else
        return 0.0;
    
    return result / [self.subjectsGrade count];
        
}

@end
