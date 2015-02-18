#import "HeadOfTheChair.h"
#import "Teacher.h"

@implementation HeadOfTheChair

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _inferiorTeachers = [[NSSet alloc] init];
    }
    return self;
}

- (NSSet *)inferiors {
    return self.inferiorTeachers;
}

// Add received object to own inferior teachers list and self object to superiors list of the received object
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    _inferiorTeachers = [self.inferiorTeachers setByAddingObject:participant];
    if (![participant.superiors containsObject:self]) {
        [participant addSuperior:self];
    }
}

// Remove received object from own inferior teachers list and self object from superiors list of the received object
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    NSMutableSet *tempSet = [self.inferiorTeachers mutableCopy];
    [tempSet removeObject:participant];
    _inferiorTeachers = tempSet;
    if ([participant.superiors containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *inferiorsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.inferiorTeachers) {
        if (!isFirst) {
            [inferiorsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [inferiorsListAsString appendString:teacher.name];
    }
    NSMutableString *studentsListAsString = [NSMutableString stringWithString:@""];
    isFirst = YES;
    for (Student *student in self.students) {
        if (!isFirst) {
            [studentsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [studentsListAsString appendString:student.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@, list of inferior teachers: [%@], list of students: [%@], department: %@}>", [self className], self.name, self.age, self.salary, inferiorsListAsString, studentsListAsString, self.department];
}

@end
