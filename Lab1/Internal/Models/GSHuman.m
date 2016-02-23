
#import "GSHuman.h"

@interface GSHuman()

@property (nonatomic) NSArray* dependents;
@property (nonatomic) NSArray* masters;

@end

@implementation GSHuman

static NSString* names[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static int namesCount = 50;

//@synthesize masters = _masters, dependents = _dependents;

- (instancetype)initRand
{
    return [self initWithName:names[arc4random()%namesCount] age:(arc4random()%4+17)];
}

- (instancetype)initWithName:(NSString*) name age:(NSInteger) age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        
        _dependents = [NSArray array];
        _masters = [NSArray array];
    }
    return self;
}


#pragma mark - participantInTheLearningProcess

- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
    if (![self.dependents containsObject:dependent]) {
        self.dependents = [self.dependents arrayByAddingObject:dependent];
        [dependent addMaster:self];
    }
}

- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
    if ([self.dependents containsObject:dependent]) {
        NSMutableArray* newDependents = [NSMutableArray arrayWithArray:self.dependents];
        [newDependents removeObject:dependent];
        self.dependents = [NSArray arrayWithArray:newDependents];
        [dependent removeMaster:self];
    }
}

- (void) addMaster:(id<participantInTheLearningProcess>) master{
    if (![self.masters containsObject:master]) {
        self.masters = [self.masters arrayByAddingObject:master];
        [master addDependent:self];
    }
}

- (void) removeMaster:(id<participantInTheLearningProcess>) master{
    if ([self.masters containsObject:master]) {
        NSMutableArray* newMasters = [NSMutableArray arrayWithArray:self.masters];
        [newMasters removeObject:master];
        self.masters = [NSArray arrayWithArray:newMasters];
        [master removeDependent:self];
    }
}


#pragma mark - description

- (NSString *)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"name %@", self.name];
    
    [description appendString:@"\nDependents:"];
    for (GSHuman<participantInTheLearningProcess>* dependent in self.dependents) {
        [description appendFormat:@"\n   %@", dependent.name];
    }
    
    [description appendString:@"\nMasters:"];
    for (GSHuman<participantInTheLearningProcess>* master in self.masters) {
        [description appendFormat:@"\n   %@", master.name];
    }
    
    return [NSString stringWithString:description];
}


@end
