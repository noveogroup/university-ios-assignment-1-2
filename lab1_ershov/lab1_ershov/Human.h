//
//  Human.h
//  lab1_ershov
//
//  Created by Admin on 15/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

@property NSString* name;
@property NSDate* birthday;

- (long)getAge;

@end
