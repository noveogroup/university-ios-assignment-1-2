#import "Human.h"
#import "ParticipantOfEducationalProcess.h"
#import "Teacher.h"
#import "ChangingGPAObserver.h"

@interface Student : Human <ParticipantOfEducationalProcess>

@property (strong, nonatomic) NSNumber *gradePointAverage;
@property (strong, nonatomic, readonly) NSSet *teachers;
@property (weak, nonatomic) DepartmentOfUniversity *department;

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage;

- (void)addChangingGPAObserver:(id<ChangingGPAObserver>)observer;
- (void)removeChangingGPAObserver:(id<ChangingGPAObserver>)observer;

@end