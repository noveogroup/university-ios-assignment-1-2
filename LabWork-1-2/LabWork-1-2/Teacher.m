#import "Teacher.h"

@implementation Teacher

- (NSSet *)getSuperiorsList {
    return [[NSSet alloc] initWithObjects:self.superior, nil];
}

- (NSSet *)getInferiorsList {
    return self.students;
}

- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = (HeadOfTheChair *)participant;
    if (![[participant getInferiorsList] containsObject:self]) {
        [participant addInferior:self];
    }
}

- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = nil;
    if ([[participant getInferiorsList] containsObject:self]) {
        [participant removeInferior:self];
    }
}

- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    if (self.students == nil) {
        _students = [[NSMutableSet alloc] init];
    }
    [self.students addObject:participant];
    if (![[participant getSuperiorsList] containsObject:self]) {
        [participant addSuperior:self];
    }
}

- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    [self.students removeObject:participant];
    if ([[participant getSuperiorsList] containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *studentsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Student *student in self.students) {
        if (!isFirst) {
            [studentsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [studentsListAsString appendString:student.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@, superior: %@, list of students: [%@]}>", [self className], self.name, self.age, self.salary, self.superior.name, studentsListAsString];
}

@end
