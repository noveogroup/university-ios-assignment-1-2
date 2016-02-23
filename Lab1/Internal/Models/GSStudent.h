
#import "GSHuman.h"

#import "participantProtocol.h"

@interface GSStudent : GSHuman <participantInTheLearningProcess>

@property (assign, nonatomic) float averageScore;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore;

@end
