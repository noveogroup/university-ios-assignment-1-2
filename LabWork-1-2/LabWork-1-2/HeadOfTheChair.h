#import "Worker.h"
#import "ParticipantOfEducationalProcess.h"
#import "Teacher.h"

@interface HeadOfTheChair : Teacher <ParticipantOfEducationalProcess>

@property (strong, nonatomic, readonly) NSSet *inferiorTeachers;

@end