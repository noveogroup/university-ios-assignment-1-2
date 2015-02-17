#import <Foundation/Foundation.h>
#import "ChangingGPAObserver.h"
#import "Student.h"

@class Teacher;
@class HeadOfTheChair;

@interface DepartmentOfUniversity : NSObject <ChangingGPAObserver>

@property (strong, nonatomic, readonly) NSSet *students;
@property (assign, nonatomic) double avarageGPA;
@property (strong, nonatomic, readonly) NSSet *teachers;
@property (weak, nonatomic) HeadOfTheChair *head;

- (void)addStudent:(Student *)student;
- (void)removeStudent:(Student *)student;
- (void)addTeacher:(Teacher *)teacher;
- (void)removeTeacher:(Teacher *)teacher;
- (void)assignHeadOfTheChair:(HeadOfTheChair *)head;
- (void)removeHeadOfTheChair:head;

@end