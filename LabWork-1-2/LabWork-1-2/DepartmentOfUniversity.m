#import "DepartmentOfUniversity.h"

@implementation DepartmentOfUniversity

- (void)recalculateGPA {
    double totalGPA = 0.0;
    for (Student *student in self.studentsList) {
        totalGPA += [student.gradePointAverage doubleValue];
    }
    self.avarageGPA = totalGPA / [self.studentsList count];
}

- (instancetype)addStudent:(Student *)student {
    if (self.studentsList == nil) {
        _studentsList = [[NSMutableSet alloc] init];
    }
    [self.studentsList addObject:student];
    [student addChangingGPAObserver:self];
    [self recalculateGPA];
    return self;
}

- (instancetype)removeStudent:(Student *)student {
    [self.studentsList removeObject:student];
    [student removeChangingGPAObserver:self];
    [self recalculateGPA];
    return self;
}

- (instancetype)addTeacher:(Teacher *)teacher {
    if (self.teachersList == nil) {
        _teachersList = [[NSMutableSet alloc] init];
    }
    [self.teachersList addObject:teacher];
    return self;
}

- (instancetype)removeTeacher:(Teacher *)teacher {
    [self.teachersList removeObject:teacher];
    return self;
}

- (instancetype)assignHeadOfTheChair:(HeadOfTheChair *)head {
    self.head = head;
    return self;
}

- (instancetype)removeHeadOfTheChair:head {
    self.head = nil;
    return self;
}

@end