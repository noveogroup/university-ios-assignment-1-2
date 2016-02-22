//
//  ADStudent.h
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import "ADHuman.h"
#import "ParticipantLearningProcessProtocol.h"


@interface ADStudent : ADHuman <ParticipantLearningProcessProtocol>

@property(assign, nonatomic) CGFloat averageScore;
@property(strong, nonatomic) NSString* nameOfUniversity;
@property(assign, nonatomic) CGFloat* amountOfYearsAtUniversity;

@end
