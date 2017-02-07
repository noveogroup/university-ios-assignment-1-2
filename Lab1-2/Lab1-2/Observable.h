//
//  Observable.h
//  Lab1-2
//
//  Created by Александр on 18.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "AveragePointObserver.h"


@protocol Observable <NSObject>


- (void)addObserver:(id<AveragePointObserver>) observer;
- (void)removeObserver:(id) observer;



@end
