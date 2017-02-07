//
//  Subject.h
//  University
//
//  Created by Иван Букшев on 2/17/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

@property (copy) NSString *name;

- (id)initWithName:(NSString *)subjectName;
- (void)addMark:(NSUInteger)mark;
- (NSArray *)getMarks;

@end
