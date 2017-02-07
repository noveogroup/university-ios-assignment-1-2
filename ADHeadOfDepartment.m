//
//  ADHeadOfDepartment.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADHeadOfDepartment.h"

@implementation ADHeadOfDepartment


#pragma mark - ParticipantLearningProcessProtocol


-(BOOL)haveBreak {
    
    BOOL ok = arc4random()% 2;
    NSLog(@"Is Head Of Department %@ have a break? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

-(void) session {
    
    NSLog(@"this is required method SESSION from protocol for the Head Of Department");
}

- (void) giveLecture {
    
    NSLog(@"this is optional method giveLecture from protocol for the Head Of Department");
}

- (void) takeExams {
    
    NSLog(@"this is optional method takeExams from protocol for the Head Of Department");
}

- (void) diplomaProdgect {
    
    NSLog(@"this is optional method diplomaProdgect from protocol for the Head Of Department");
}

- (void) listenLecture {
    
    NSLog(@"this is optional method listenLecture from protocol for the Head Of Department");
}

@end
