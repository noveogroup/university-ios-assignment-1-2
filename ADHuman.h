//
//  ADHuman.h
//  Proj 1,2
//
//  Created by АлиДени on 16.02.16.
//  Copyright © 2016 Alisa Denisova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ADHuman : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger *age;

+ (void) whoAreYou;

- (void) sayHello;
- (void) say:(NSString*) string;
- (void) say:(NSString*) string and:(NSString*) string2;
- (void) say:(NSString*) string and:(NSString*) string2 andAfterThat:(NSString*) string3;

- (NSString*) saySomeNumberString;
- (NSString*) saySomething;

@end
