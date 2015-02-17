#import "Student.h"

@interface Student ()

@property (strong, nonatomic) NSMutableSet *changingGPAObserversList;

@end

@implementation Student

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage {
    self = [self initWithName:name age:age];
    if (self != nil) {
        _gradePointAverage = gradePointAverage;
    }
    return self;
}

- (NSSet *)getSuperiorsList {
    return self.teachers;
}

- (NSSet *)getInferiorsList {
    return nil;
}

- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    if (self.teachers == nil) {
        _teachers = [[NSMutableSet alloc] init];
    }
    [self.teachers addObject:participant];
    if (![[participant getInferiorsList] containsObject:self]) {
        [participant addInferior:self];
    }
}

- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    [self.teachers removeObject:participant];
    if ([[participant getInferiorsList] containsObject:self]) {
        [participant removeInferior:self];
    }
}

- (NSString *)description {
    NSMutableString *teachersListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.teachers) {
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

- (void)setGradePointAverage:(NSNumber *)gpa {
    _gradePointAverage = gpa;
    [self notifyAllChangingGPAObservers];
}

#pragma mark - Changing GPA Observer Methods
- (void)addChangingGPAObserver:(id<ChangingGPAObserver>)observer {
    if (self.changingGPAObserversList == nil) {
        self.changingGPAObserversList = [[NSMutableSet alloc] init];
    }
    [self.changingGPAObserversList addObject:observer];
}

- (void)removeChangingGPAObserver:(id<ChangingGPAObserver>)observer {
    [self.changingGPAObserversList removeObject:observer];
}

- (void)notifyAllChangingGPAObservers {
    for (id<ChangingGPAObserver> observer in self.changingGPAObserversList) {
        [observer recalculateGPA];
    }
}

@end
