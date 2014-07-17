//
//  UniversitySingleton.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/16/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecalculatePointsDelegate.h"
#import "EducationMember.h"

@interface UniversitySingleton : NSObject <RecalculatePointsDelegate>

@property (nonatomic, strong) id<EducationMember> headOfUniversity;

+ (UniversitySingleton *)sharedInstance;

@end
