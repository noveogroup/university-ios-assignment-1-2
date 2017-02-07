//
//  University.h
//  Lab1
//
//  Created by Пользователь on 18/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deportament.h"

@interface University : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, strong) NSMutableSet *deportaments;

-(void) addDeportament:(Deportament*) deportament;
-(NSSet*) getDeportaments;

@end
