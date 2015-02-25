#import "Worker.h"
#import "ParticipantOfEducationalProcess.h"
#import "Student.h"

@class HeadOfTheChair;

@interface Teacher : Worker <ParticipantOfEducationalProcess>

@property (strong, nonatomic, readonly) NSSet *students;
@property (weak, nonatomic, readonly) HeadOfTheChair *superior;
@property (weak, nonatomic) DepartmentOfUniversity *department;

@end