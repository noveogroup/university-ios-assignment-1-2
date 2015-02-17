#import "Student.h"

@interface Student ()

@property (strong, nonatomic) NSMutableSet *changingGPAObserversList;
@property (strong, nonatomic) NSMutableSet *inferiors;

@end

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _teachers = [[NSMutableSet alloc] init];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage {
    self = [self initWithName:name age:age];
    if (self != nil) {
        _gradePointAverage = gradePointAverage;
    }
    return self;
}

- (NSMutableSet *)superiors {
    return self.teachers;
}

// Add received object to own superiors list and self object to inferiors list of the reveived object
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    [self.teachers addObject:participant];
    if (![participant.inferiors containsObject:self]) {
        [participant addInferior:self];
    }
}

// Remove received object from own superiors list and self object from inferiors list of the reveived object
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    [self.teachers removeObject:participant];
    if ([participant.inferiors containsObject:self]) {
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
