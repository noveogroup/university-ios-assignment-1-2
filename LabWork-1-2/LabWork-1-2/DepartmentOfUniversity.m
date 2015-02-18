#import "DepartmentOfUniversity.h"
#import "HeadOfTheChair.h"

@implementation DepartmentOfUniversity

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _students = [[NSSet alloc] init];
        _teachers = [[NSSet alloc] init];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [self init];
    if (self != nil) {
        _name = name;
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

// Add student to students list and assign the department to him
- (void)addStudent:(Student *)student {
    _students = [self.students setByAddingObject:student];
    student.department = self;
    [student addChangingGPAObserver:self];
    [self recalculateGPA];
}

// Remove student from students list and remove it's department
- (void)removeStudent:(Student *)student {
    _students = [self.students setByRemovingObject:student];
    student.department = nil;
    [student removeChangingGPAObserver:self];
    [self recalculateGPA];
}

// Add teacher to teachers list and assign the department to him
- (void)addTeacher:(Teacher *)teacher {
    _teachers = [self.teachers setByAddingObject:teacher];
    teacher.department = self;
}

// Remove teacher from teachers list and remove it's department
- (void)removeTeacher:(Teacher *)teacher {
    _teachers = [self.teachers setByRemovingObject:teacher];
    teacher.department = nil;
}

// Assign head of the chair and set the department to his department property
- (void)assignHeadOfTheChair:(HeadOfTheChair *)head {
    self.head = head;
    head.department = self;
}

// Remove head of the chair and set his department property to nil
- (void)removeHeadOfTheChair:(HeadOfTheChair *)head {
    self.head = nil;
    head.department = nil;
}

- (NSString *)description {
    return self.name;
}

@end