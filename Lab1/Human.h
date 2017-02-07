//
//  Human.h
//  Lab1
//
//  Created by Admin on 14/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef Lab1_Human_h
#define Lab1_Human_h

@interface Human : NSObject

@property (nonatomic, copy) NSString *fullname;
@property (nonatomic, assign) NSNumber *age;

+(instancetype) humanWithFullName:(NSString*) fullName
                              age:(NSNumber*) age;

-(instancetype) initWithFullName:(NSString*) fullName
                             age:(NSNumber*) age;

@end


#endif
