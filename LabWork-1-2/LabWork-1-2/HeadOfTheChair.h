#import "Worker.h"
#import "ParticipantOfEducationalProcess.h"

@class Teacher;

@interface HeadOfTheChair : Worker <ParticipantOfEducationalProcess>

@property (strong, nonatomic) NSMutableSet *inferiorsList;

@end