
#import <Foundation/Foundation.h>

@protocol participantInTheLearningProcess <NSObject>

@property (nonatomic, readonly) NSArray* dependents; //подчиненные
@property (nonatomic, readonly) NSArray* masters; //хозяева

@required
- (void) addDependent:(id<participantInTheLearningProcess>) dependent;
- (void) removeDependent:(id<participantInTheLearningProcess>) dependent;
- (void) addMaster:(id<participantInTheLearningProcess>) master;
- (void) removeMaster:(id<participantInTheLearningProcess>) master;

@end
