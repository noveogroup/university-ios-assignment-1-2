//
//  AveragePointObserver.h
//  Lab1-2
//
//  Created by Александр on 16.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Observable;

@protocol AveragePointObserver <NSObject>

-(void)recalculateAveragePoint:(id<Observable>) observer;

@end
