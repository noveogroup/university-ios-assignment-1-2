#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage {
    self = [self initWithName:name age:age];
    self.gradePointAverage = gradePointAverage;
    return self;
}

- (NSSet *)getSuperiorsList {
    return self.teachersList;
}

- (NSSet *)getInferiorsList {
    return nil;
}

- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    if (self.teachersList == nil) {
        self.teachersList = [[NSMutableSet alloc] init];
    }
    [self.teachersList addObject:participant];
    if (![[participant getInferiorsList] containsObject:self]) {
        [participant addInferior:self];
    }
}

- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    [self.teachersList removeObject:participant];
    if ([[participant getInferiorsList] containsObject:self]) {
        [participant removeInferior:self];
    }
}

- (NSString *)description {
    NSMutableString *teachersListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.teachersList) {
        if (!isFirst) {
            [teachersListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [teachersListAsString appendString:teacher.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, GPA: %@, list of teachers: [%@]}>", [self className], self.name, self.age, self.gradePointAverage, teachersListAsString];
}

@end
