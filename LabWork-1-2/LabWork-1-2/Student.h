#import "Human.h"
#import "ParticipantOfEducationalProcess.h"
#import "Teacher.h"
#import "ChangingGPAObserver.h"

@interface Student : Human <ParticipantOfEducationalProcess>

@property (strong, nonatomic) NSNumber *gradePointAverage;
@property (strong, nonatomic, readonly) NSMutableSet *teachers;

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage;

- (void)addChangingGPAObserver:(id<ChangingGPAObserver>)observer;
- (void)removeChangingGPAObserver:(id<ChangingGPAObserver>)observer;

@end