
#import <Foundation/Foundation.h>

@protocol participantInTheLearningProcess <NSObject>

//@property (nonatomic, readonly) NSArray* dependents; //подчиненные
//@property (nonatomic, readonly) id master; //хозяева

@required
- (void) addDependent:(id<participantInTheLearningProcess>) dependent;
- (void) removeDependent:(id<participantInTheLearningProcess>) dependent;

- (void) setMaster:(id<participantInTheLearningProcess>) master;
- (void) removeMaster;

- (NSArray*) getDependents;
- (id<participantInTheLearningProcess>) getMaster;

@end
