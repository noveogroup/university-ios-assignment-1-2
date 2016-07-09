#import <Foundation/Foundation.h>

@interface Forest : NSObject

@property NSMutableArray *objects;

+ (instancetype)sharedForest;
- (void)simulateDay;
- (BOOL)isEnd;

@end
