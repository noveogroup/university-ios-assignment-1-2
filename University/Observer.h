//
//  Observer.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Subject;
@class Student;
@class Cathedral;

@interface Observer : NSObject

+ (Observer *)sharedInstance;
- (NSDictionary *)globalJournal;
- (void) addAverageMark:(NSNumber *)mark toStudent:(Student *)student;
- (double)getAverageMarkOfCathedral:(Cathedral *)cathedral;

@end
