//
//  ParticipantLearningProcessProtocol.h
//  Proj 1,2
//
//  Created by АлиДени on 22.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ParticipantLearningProcessProtocol <NSObject>

@required

@property(strong, nonatomic) NSString* nameOfUniversity;
@property(assign, nonatomic) CGFloat* amountOfYearsAtUniversity;

-(BOOL)haveBreak;
-(void) session;


@optional

- (void) haveGradebook;
- (void) passExams;
- (void) takeExams;
- (void) giveLecture;
- (void) listenLecture;
- (BOOL) goToLibrary;
- (void) diplomaProdgect;

@end
