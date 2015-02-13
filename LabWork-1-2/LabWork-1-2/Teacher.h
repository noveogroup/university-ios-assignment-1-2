#import "Worker.h"
#import "HeadOfTheChair.h"
#import "ParticipantOfEducationalProcess.h"
#import "Student.h"

@interface Teacher : Worker <ParticipantOfEducationalProcess>

@property (strong, nonatomic) NSMutableSet *studentsList;
@property (weak, nonatomic) HeadOfTheChair *superior;

@end