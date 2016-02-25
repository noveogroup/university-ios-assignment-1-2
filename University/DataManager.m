//
//  DataManager.m
//  University
//
//  Created by Oleg Sannikov on 2/22/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "DataManager.h"
#import "Department.h"

@interface DataManager (){
    NSMutableSet<Department *> *_departments;
}

@end

@implementation DataManager
+ (instancetype)sharedManager{
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _departments = [NSMutableSet new];
    }
    
    return self;
}


#pragma mark - Accessors
- (NSSet<Department *> *)departments{
    return _departments;
}


#pragma mark - Public
- (void)addDepartment:(Department *)department{
    [_departments addObject:department];
}

@end
