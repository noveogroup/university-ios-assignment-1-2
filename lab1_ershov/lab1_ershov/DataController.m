//
// Created by Admin on 16/07/14.
// Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "DataController.h"
#import "Department.h"

@interface DataController ()
@property (nonatomic) NSMutableArray *mDepartments;
@end

@implementation DataController

static DataController *instance = nil;

+ (DataController *)sharedInstance {
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [[DataController alloc] init];
        }
    }

    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.mDepartments = [[NSMutableArray alloc] init];
    }

    return self;
}


- (void)addDepartment:(Department *)department {
    [self.mDepartments addObject:department];
}

- (NSArray *)departments {
    return self.mDepartments;
}

@end