
#import "GSHuman.h"

#import "participantProtocol.h"

@class GSGroup;

@interface GSStudent : GSHuman <participantInTheLearningProcess>

@property (assign, nonatomic) float averageScore;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore;

@property (strong, nonatomic) GSGroup* group;


@end
