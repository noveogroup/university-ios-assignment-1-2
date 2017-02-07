//
//  University.m
//  Lab1
//
//  Created by Пользователь on 18/02/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "University.h"

@implementation University

+(instancetype) sharedInstance{
    
    static University *_sharedInstance = nil;
    @synchronized(self){
        
        if (_sharedInstance == nil){
            
            _sharedInstance = [[University alloc] init];
        }
    }
    return _sharedInstance;
}

-(void) addDeportament:(Deportament *)deportament{
    if (!self.deportaments)
        self.deportaments = [[NSMutableSet alloc] init];
    
    [self.deportaments addObject:deportament];
}

-(NSSet*) getDeportaments{
    return [self.deportaments copy];
}

@end
