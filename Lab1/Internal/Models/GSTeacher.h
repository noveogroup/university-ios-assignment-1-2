
#import "GSHuman.h"

#import "participantProtocol.h"

@interface GSTeacher : GSHuman <participantInTheLearningProcess>

@property (assign, nonatomic) float salary;
@property (assign, nonatomic) NSInteger expirience; //years

@property (strong, nonatomic) id<participantInTheLearningProcess> group;

@end
