#import "HeadOfTheChair.h"
#import "Teacher.h"

@implementation HeadOfTheChair

- (NSSet *)getSuperiorsList {
    return nil;
}

- (NSSet *)getInferiorsList {
    return self.inferiorsList;
}

- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    if (self.inferiorsList == nil) {
        self.inferiorsList = [[NSMutableSet alloc] init];
    }
    [self.inferiorsList addObject:participant];
    if (![[participant getSuperiorsList] containsObject:self]) {
        [participant addSuperior:self];
    }
}

- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    [self.inferiorsList removeObject:participant];
    if ([[participant getSuperiorsList] containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *inferiorsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.inferiorsList) {
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
