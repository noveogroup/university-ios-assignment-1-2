
#import <Foundation/Foundation.h>

#import "GSManager.h"
#import "GSGroup.h"
#import "participantProtocol.h"

@interface GSFaculty : NSObject <participantInTheLearningProcess>

@property (strong, nonatomic) NSMutableArray <GSGroup*>* groups;
@property (strong, nonatomic) GSManager* manager;

+(GSFaculty*) sharedFaculty;
- (instancetype)init;

- (float) getAverageScore;
- (void) turnOnObserving;

@end
