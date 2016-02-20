//
//  participantProtocol.h
//  Lab1
//
//  Created by Sukhorukov Grigory on 20.02.16.
//  Copyright © 2016 Sukhorukov Grigory. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol participantInTheLearningProcess <NSObject>

@property (strong, nonatomic) NSMutableArray* dependents; //подчиненные
@property (strong, nonatomic) NSMutableArray* masters; //хозяева

@required
- (void) addDependent:(id<participantInTheLearningProcess>) dependent;
- (void) removeDependent:(id<participantInTheLearningProcess>) dependent;
- (void) addMaster:(id<participantInTheLearningProcess>) master;
- (void) removeMaster:(id<participantInTheLearningProcess>) master;

@end
