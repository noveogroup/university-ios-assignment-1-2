#import "Worker.h"
#import "HeadOfTheChair.h"
#import "ParticipantOfEducationalProcess.h"
#import "Student.h"

@interface Teacher : Worker <ParticipantOfEducationalProcess>

@property (strong, nonatomic, readonly) NSMutableSet *studentsList;
@property (weak, nonatomic, readonly) HeadOfTheChair *superior;

@end