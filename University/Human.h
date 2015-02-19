//
//  Human.h
//  University
//
//  Created by Иван Букшев on 2/19/15.
//  Copyright (c) 2015 Иван Букшев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

@property (copy) NSString *name;
@property (copy) NSString *birthday;

- (void)description;

@end
