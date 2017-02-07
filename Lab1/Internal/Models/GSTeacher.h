
#import "GSHuman.h"

#import "participantProtocol.h"

@class GSGroup;

@interface GSTeacher : GSHuman <participantInTheLearningProcess>

@property (assign, nonatomic) float salary;
@property (assign, nonatomic) NSInteger expirience; //years

@property (strong, nonatomic) GSGroup *group;

@end
