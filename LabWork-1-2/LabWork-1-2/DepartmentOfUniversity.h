#import <Foundation/Foundation.h>
#import "ChangingGPAObserver.h"
#import "Student.h"
#import "HeadOfTheChair.h"
#import "Teacher.h"

@interface DepartmentOfUniversity : NSObject <ChangingGPAObserver>

@property (strong, nonatomic, readonly) NSMutableSet *studentsList;
@property (assign, nonatomic) double avarageGPA;
@property (strong, nonatomic, readonly) NSMutableSet *teachersList;
@property (weak, nonatomic) HeadOfTheChair *head;

- (instancetype)addStudent:(Student *)student;
- (instancetype)removeStudent:(Student *)student;
- (instancetype)addTeacher:(Teacher *)teacher;
- (instancetype)removeTeacher:(Teacher *)teacher;
- (instancetype)assignHeadOfTheChair:(HeadOfTheChair *)head;
- (instancetype)removeHeadOfTheChair:head;

@end