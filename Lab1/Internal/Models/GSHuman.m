
#import "GSHuman.h"

@interface GSHuman()

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
    }
    return self;
}

/*
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
 */


@end
