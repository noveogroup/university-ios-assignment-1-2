//
//  Forest.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forest : NSObject

//жители леса
@property NSMutableArray *forestResidents;

+ (Forest *) sharedInstance;
- (void)simulateDay;
- (void)deleteResident:(id)resident;
@end
