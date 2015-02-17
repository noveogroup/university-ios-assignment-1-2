#import "HeadOfTheChair.h"
#import "Teacher.h"

@implementation HeadOfTheChair

- (NSSet *)getSuperiorsList {
    return nil;
}

- (NSSet *)getInferiorsList {
    return self.inferiors;
}

- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    if (self.inferiors == nil) {
        _inferiors = [[NSMutableSet alloc] init];
    }
    [self.inferiors addObject:participant];
    if (![[participant getSuperiorsList] containsObject:self]) {
        [participant addSuperior:self];
    }
}

- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    [self.inferiors removeObject:participant];
    if ([[participant getSuperiorsList] containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *inferiorsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.inferiors) {
        if (!isFirst) {
            [inferiorsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [inferiorsListAsString appendString:teacher.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@, list of inferiors: [%@]}>", [self className], self.name, self.age, self.salary, inferiorsListAsString];
}

@end
