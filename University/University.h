//
//  University.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Faculty;

@interface University : NSObject

@property (copy) NSString *name;

- (id)initWithName:(NSString *)name;
- (void)addFaculty:(Faculty *)faculty;
- (NSArray *)getFaculties;

@end
