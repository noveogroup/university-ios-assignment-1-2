//
//  LivingBeing.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LivingBeing : NSObject {
    
    NSString *_name;
    float _calories;
}

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) float calories;

- (instancetype)initWithName:(NSString *)name;

@end
