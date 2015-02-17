#import "DepartmentOfUniversity.h"

@implementation DepartmentOfUniversity

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _students = [[NSSet alloc] init];
        _teachers = [[NSSet alloc] init];
    }
    return self;
}

- (void)recalculateGPA {
    double totalGPA = 0.0;
    for (Student *student in self.students) {
        totalGPA += [student.gradePointAverage doubleValue];
    }
    self.avarageGPA = totalGPA / [self.students count];
}

- (void)addStudent:(Student *)student {
    _students = [self.students setByAddingObject:student];
    [student addChangingGPAObserver:self];
    [self recalculateGPA];
}

- (void)removeStudent:(Student *)student {
    NSMutableSet *tempSet = [self.students mutableCopy];
    [tempSet removeObject:student];
    _students = tempSet;
    [student removeChangingGPAObserver:self];
    [self recalculateGPA];
}

- (void)addTeacher:(Teacher *)teacher {
    _teachers = [self.teachers setByAddingObject:teacher];
}

- (void)removeTeacher:(Teacher *)teacher {
    NSMutableSet *tempSet = [self.teachers mutableCopy];
    [tempSet removeObject:teacher];
    _teachers = tempSet;
}

- (void)assignHeadOfTheChair:(HeadOfTheChair *)head {
    self.head = head;
}

- (void)removeHeadOfTheChair:head {
    self.head = nil;
}

@end