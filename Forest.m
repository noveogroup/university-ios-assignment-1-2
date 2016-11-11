#import "Forest.h"
#import "Predator.h"
#import "Plant.h"
#import "Herbivorous.h"
#import "Garbage.h"
#import "Constants.h"


@implementation Forest

+(id)instance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [(Forest *) [super alloc] initUniqueInstance];
    });
    return shared;
}

-(id) initUniqueInstance {
    return [super init];
}

-(void)prepare {
    self.day = @0;
    self.creatures = [[NSMutableSet alloc] initWithSet:self.newHabitants];
}

-(void) simulate {
    [self prepare];
    do {
        [self simulateDay];
    } while (![self isPredatorAlone]);

    // show stomach of last predator
    for (Creature *lastPredator in self.creatures) {
        if ([lastPredator isMemberOfClass:[Predator class]]){
            NSLog(@"The last predator has them in his stomach:\n%@", [(Animal *) lastPredator showStomach:@""]);
        }
    }
}

-(void)simulateDay {
    self.day = @([self.day intValue] + 1);
    NSArray *arr = [self.creatures allObjects];
    Creature *ra1; // random animal
    Creature *ra2; // random victim

    do {
        ra1 = arr[arc4random_uniform((uint32_t) [arr count])];
    } while (!(BOOL) [ra1 isKindOfClass:[Animal class]]);

    do {
        ra2 = arr[arc4random_uniform((uint32_t) [arr count])];
    } while ([ra1 isEqualTo:ra2]);

    NSLog(@"\n\n Day %@", self.day);

    if ([self isAnimal:ra1 canEat:ra2]) {
        NSLog(@"yes, %@ can eat %@", ra1, ra2);
        [(Animal *) ra1 eatsAn:ra2];
        [self.creatures removeObject:ra2];
    } else {
        NSLog(@"no, %@ can't eat %@", ra1, ra2);
    }
}

-(BOOL) isPredatorAlone {
    int pc = 0;
    NSArray *arr = [self.creatures allObjects];

    for (NSUInteger i = 0; i < self.creatures.count; i++) {
        pc += [arr[i] isMemberOfClass:[Predator class]];
    }

    NSLog(@"There is %i Predators", pc);
    return pc == 1;
}

// rules
- (BOOL)isAnimal:(Creature *)creation1 canEat:(Creature *)creation2{
//    if([creation1 isMemberOfClass:[Plant class]] || [creation1 isMemberOfClass:[Garbage class]] )
//        return NO;

    if([creation1 isMemberOfClass:[Predator class]]){
        if ([creation2 isMemberOfClass:[Predator class]])
            return (![(Predator *) creation2 isDefending]) && ([(Predator *)creation1 weight] > [(Predator *)creation2 weight]);

        if ([creation2 isMemberOfClass:[Herbivorous class]])
            return ![(Herbivorous *) creation2 isDefending];

        return [creation2 isMemberOfClass:[Garbage class]];
    }

    if([creation1 isMemberOfClass:[Herbivorous class]]){
        if ([creation2 isMemberOfClass:[Plant class]])
            return YES;

        return [creation2 isMemberOfClass:[Garbage class]];
    }

    return NO;
}


-(NSMutableSet *) newHabitants {
    NSMutableSet *forestCreatures = [[NSMutableSet alloc] init];

    // create plants
    for (int i = 0; i < arc4random_uniform(50); i++) {
        Plant *plant = [[Plant alloc] init];
        [plant setName:[NSString stringWithFormat:@"flower_%d", i]];
        [forestCreatures addObject:plant];
    }

    // create garbage
    for (int i = 0; i < arc4random_uniform(150); i++) {
        [forestCreatures addObject:[[Garbage alloc] init]];
    }

    // create Herbivorouses
    for (int i = 0; i < arc4random_uniform(20); i++) {
        Herbivorous *herbivorous = [[Herbivorous alloc] init];
        [herbivorous setName:[NSString stringWithFormat:@"Herbivorous_%d", i]];
        [forestCreatures addObject:herbivorous];
    }

    // create predators
    for (int i = 0; i < arc4random_uniform(20) + MINIMUM_COUNT_OF_PREDATORS; i++) {
        Predator *predator = [[Predator alloc] init];
        [predator setName:[NSString stringWithFormat:@"Predator_%d", i]];
        [forestCreatures addObject:predator];
    }

    return forestCreatures;
}

@end