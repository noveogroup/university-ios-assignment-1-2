//
//  Forest.h
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Forest : NSObject

@property(readonly,nonatomic) NSArray *creatures;
@property(readonly,nonatomic) NSArray *predators;
@property(readonly,nonatomic) BOOL isLastPredator;

+ (instancetype)sharedInstance;

- (void)simulate;
- (BOOL)isLastPredator;
- (BOOL)canEatObj1:(id)creature1 obj2:(id)creature2 calories:(NSInteger *)calories;
- (void)inspectStomach:(id)animal;


@end


