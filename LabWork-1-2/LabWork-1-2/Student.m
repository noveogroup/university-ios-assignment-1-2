#import "Student.h"

@interface Student ()

@property (strong, nonatomic) NSMutableSet *changingGPAObserversList;
@property (strong, nonatomic) NSSet *superiors;
@property (strong, nonatomic) NSSet *inferiors;
@property (strong, nonatomic) NSSet *students;

@end

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _teachers = [[NSSet alloc] init];
        _changingGPAObserversList = [[NSMutableSet alloc] init];
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

- (NSSet *)superiors {
    return self.teachers;
}

// Add received object to own teachers list and self object to students list of the received object
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _teachers = [self.teachers setByAddingObject:participant];
    if (![participant.students containsObject:self]) {
        [participant addStudent:self];
    }
}

// Remove received object from own teachers list and self object from students list of the received object
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _teachers = [self.teachers setByRemovingObject:participant];
    if ([participant.students containsObject:self]) {
        [participant removeStudent:self];
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
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, GPA: %@, list of teachers: [%@], department: %@}>", [self className], self.name, self.age, self.gradePointAverage, teachersListAsString, self.department];
}

- (void)setGradePointAverage:(NSNumber *)gpa {
    _gradePointAverage = gpa;
    [self notifyAllChangingGPAObservers];
}

#pragma mark - Changing GPA Observer Methods
- (void)addChangingGPAObserver:(id<ChangingGPAObserver>)observer {
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
