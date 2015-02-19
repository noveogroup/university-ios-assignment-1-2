//
//  Faculty.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cathedral;
@class University;

@interface Faculty : NSObject

@property (copy) NSString *name;
@property (weak) University *university;

- (id)initWithName:(NSString *)name andUniversity:(University *)university;
- (void)addCathedral:(Cathedral *)cathedral;
- (NSArray *)getCathedrals;

@end
