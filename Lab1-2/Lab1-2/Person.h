//
//  Person.h
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *firsName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSNumber *age;

- (instancetype)initWithFirstName:(NSString*)fName lastName:(NSString*)lName andAge:(NSNumber*)age;



@end
