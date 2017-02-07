//
//  ADStudent.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADStudent.h"

@implementation ADStudent



#pragma mark - ParticipantLearningProcessProtocol

-(BOOL)haveBreak {
    
    BOOL ok = arc4random()% 2;
    NSLog(@"Student should be resting enough during the study. Is student %@ have a break? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

-(void) session {
    
    NSLog(@"this is required cool method SESSION from protocol for the Student");
}

- (void) haveGradebook {
    
    NSLog(@"this is optional method haveGradebook from protocol for the Student ");
}

- (void) passExams {
    
     NSLog(@"this is optional method passExams from protocol for the Student ");
}

- (void) listenLecture {
    
     NSLog(@"this is optional method listenLecture from protocol for the Student ");
}

- (BOOL) goToLibrary {
    
    BOOL ok = arc4random()% 2;
    NSLog(@"Is student %@ visiting the library? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}
- (void) diplomaProdgect {
    
    NSLog(@"this is optional method diplomaProdgect from protocol for the Student ");
}


@end
