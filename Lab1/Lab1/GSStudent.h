//
//  GSStudent.h
//  Lab1
//
//  Created by Sukhorukov Grigory on 20.02.16.
//  Copyright © 2016 Sukhorukov Grigory. All rights reserved.
//

#import "GSHuman.h"

//#import "participantProtocol.h"

@interface GSStudent : GSHuman //<participantInTheLearningProcess>

@property (assign, nonatomic) float averageScore;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore;

@end
