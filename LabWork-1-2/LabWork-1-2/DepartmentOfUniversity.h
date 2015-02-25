#import <Foundation/Foundation.h>
#import "ChangingGPAObserver.h"
#import "Student.h"

@class Teacher;
@class HeadOfTheChair;

@interface DepartmentOfUniversity : NSObject <ChangingGPAObserver>

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic, readonly) NSSet *students;
@property (assign, nonatomic) double avarageGPA;
@property (strong, nonatomic, readonly) NSSet *teachers;
@property (weak, nonatomic) HeadOfTheChair *head;

- (instancetype)initWithName:(NSString *)name;
- (void)addStudent:(Student *)student;
- (void)removeStudent:(Student *)student;
- (void)addTeacher:(Teacher *)teacher;
- (void)removeTeacher:(Teacher *)teacher;
- (void)assignHeadOfTheChair:(HeadOfTheChair *)head;
- (void)removeHeadOfTheChair:(HeadOfTheChair *)head;

@end