#import "Human.h"
#import "ParticipantOfEducationalProcess.h"
#import "Teacher.h"

@interface Student : Human <ParticipantOfEducationalProcess>

@property (strong, nonatomic) NSNumber *gradePointAverage;
@property (strong, nonatomic) NSMutableSet *teachersList;

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage;

@end