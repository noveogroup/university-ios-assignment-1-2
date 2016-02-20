//
//  GSHuman.h
//  Lab1
//
//  Created by Sukhorukov Grigory on 20.02.16.
//  Copyright © 2016 Sukhorukov Grigory. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "participantProtocol.h"

@interface GSHuman : NSObject <participantInTheLearningProcess>

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age;

- (NSString *)description;

@end
