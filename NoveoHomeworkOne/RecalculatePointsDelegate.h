//
//  RecalculatePointsDelegate.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/16/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EducationMember.h"

@protocol RecalculatePointsDelegate <NSObject>

- (NSNumber *) recalculatePoints :(__weak id<EducationMember>)sender;

@end
