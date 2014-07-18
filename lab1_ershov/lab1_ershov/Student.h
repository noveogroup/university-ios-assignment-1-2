//
//  Student.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HasAverageMark.h"
#import "Human.h"
#import "Observable.h"

@interface Student : Human <HasAverageMark, Observable>

- (void)addMark:(int)mark;

@end
