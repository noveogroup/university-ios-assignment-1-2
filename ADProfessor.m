//
//  ADProfessor.m
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADProfessor.h"


@implementation ADProfessor

#pragma mark - ParticipantLearningProcessProtocol


-(BOOL)haveBreak {
    
    BOOL ok = arc4random()% 2;
    NSLog(@"Is Professor %@ have a break? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

-(void) session {
    
    NSLog(@"this is required method SESSION from protocol for the Professor");
}

- (void) giveLecture {
    
    NSLog(@"this is optional method giveLecture from protocol for the Professor");
}


- (void) takeExams {
    
    NSLog(@"this is optional method takeExams from protocol for the Professor");
}

- (BOOL) goToLibrary {
    
    BOOL ok = arc4random()% 2;
    NSLog(@"Is Professor %@ visiting the library? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void) diplomaProdgect {
    
    NSLog(@"this is optional method diplomaProdgect from protocol for the Professor ");
}

@end
