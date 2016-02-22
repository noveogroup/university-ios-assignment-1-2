
#import <Foundation/Foundation.h>

#import "GSManager.h"
#import "GSGroup.h"

@interface GSFaculty : NSObject

@property (strong, nonatomic) NSMutableArray <GSGroup*>* groups;
@property (strong, nonatomic) GSManager* manager;

+(GSFaculty*) sharedFaculty;
- (instancetype)init;

- (void) addGroup:(GSGroup*) group;
- (void) removeGroup:(GSGroup*) group;

- (float) getAverageScore;
- (void) turnOnObserving;

@end
