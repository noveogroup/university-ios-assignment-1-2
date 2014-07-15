//
//  main.m
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray * students = [[NSMutableArray alloc] init];

        [students addObject:[[Student alloc] initWithName:@"Alexandr"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"01/13/1992"]
                                              AverageMark:4.7]];
        [students addObject:[[Student alloc] initWithName:@"Bjorn"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"02/22/1991"]
                                              AverageMark:5.0]];
        [students addObject:[[Student alloc] initWithName:@"Sigismund"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"12/11/1993"]
                                              AverageMark:4.5]];
        [students addObject:[[Student alloc] initWithName:@"John"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"07/01/1994"]
                                              AverageMark:4.6]];
        [students addObject:[[Student alloc] initWithName:@"Jose"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"03/19/1990"]
                                              AverageMark:4.3]];
        [students addObject:[[Student alloc] initWithName:@"Ibragim"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"04/27/1992"]
                                              AverageMark:3.9]];
        [students addObject:[[Student alloc] initWithName:@"Maria"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"03/25/1992"]
                                              AverageMark:4.7]];
        [students addObject:[[Student alloc] initWithName:@"Harry"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"05/03/1993"]
                                              AverageMark:3.7]];
        [students addObject:[[Student alloc] initWithName:@"Jerry"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"07/04/1991"]
                                              AverageMark:3.5]];
        [students addObject:[[Student alloc] initWithName:@"Jango"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"11/10/1993"]
                                              AverageMark:4.9]];
        [students addObject:[[Student alloc] initWithName:@"Emma"
                                                 Birthday:[NSDate dateWithNaturalLanguageString:@"10/09/1993"]
                                              AverageMark:4.1]];

        Teacher *teacher = [[Teacher alloc] init];
        teacher.name = @"Minerva MacGonagall";
        teacher.birthday = [NSDate dateWithNaturalLanguageString:@"10/09/1953"];
        teacher.salary = 25500;

        for (int i = 0; i < [students count] / 2; ++i) {
            [teacher addStudent:[students objectAtIndex:(NSUInteger) i]];
        }

        NSLog([teacher description]);

    }
    return 0;
}

