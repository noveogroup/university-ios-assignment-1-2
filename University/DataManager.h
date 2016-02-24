//
//  DataManager.h
//  University
//
//  Created by Oleg Sannikov on 2/22/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Department;

@interface DataManager : NSObject
+ (instancetype)sharedManager;

@property (nonatomic, readonly) NSSet<Department *> *departments;

- (void)addDepartment:(Department *)department;

@end
