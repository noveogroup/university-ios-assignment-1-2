//
//  StudentAvgObserver.h
//  Lab1
//
//  Created by Admin on 15/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StudentAvgObserver <NSObject>

@required
-(void) reCalcAverage;

@end
