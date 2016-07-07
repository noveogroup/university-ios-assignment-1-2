//
//  Forest.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forest : NSObject

@property NSMutableArray *objects;

+ (instancetype)sharedForest;
- (void)simulateDay;

@end
