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
    for (Predator *lastPredator in self.creatures) {
        if ([lastPredator isMemberOfClass:[Predator class]]){
            NSLog(@"The last predator has them in his stomach:\n%@", [(Animal *) lastPredator showStomach:@""]);
        }
    }
}

-(void)simulateDay {
    self.day = @([self.day intValue] + 1);
    NSArray *arr = [self.creatures allObjects];
    id<Calories> _Nonnull ra1; // random animal
    id<Calories> _Nonnull ra2; // random victim

    do {
        ra1 = arr[arc4random() % arr.count];
    } while (!(BOOL) [ra1 isKindOfClass:[Animal class]]);

    do {
        ra2 = arr[arc4random() % arr.count];
    } while (ra1 == ra2);

    NSLog(@"\n\n Day %@", self.day);

    if ([ra1 conformsToProtocol:@protocol(Eater)]) {
        if ([(id <Eater>)ra1 canEat:ra2]) {
            NSLog(@"yes, %@ can eat %@", ra1, ra2);
            [(id<Eater>)ra1 eatsAn:ra2];
            [self.creatures removeObject:ra2];
        } else {
            NSLog(@"no, %@ can't eat %@", ra1, ra2);
        }
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


-(NSMutableSet *) newHabitants {
    NSMutableSet *forestCreatures = [[NSMutableSet alloc] init];

    // create plants
    for (int i = 0; i < arc4random_uniform(50); i++) {
        Plant *plant = [[Plant alloc] initWithId:i];
        [forestCreatures addObject:plant];
    }

    // create garbage
    for (int i = 0; i < arc4random_uniform(150); i++) {
        [forestCreatures addObject:[[Garbage alloc] init]];
    }

    // create Herbivorouses
    for (int i = 0; i < arc4random_uniform(20); i++) {
        Herbivorous *herbivorous = [[Herbivorous alloc] initWithId:i];
        [forestCreatures addObject:herbivorous];
    }

    // create predators
    for (int i = 0; i < arc4random_uniform(20) + MINIMUM_COUNT_OF_PREDATORS; i++) {
        Predator *predator = [[Predator alloc] initWithId:i];
        [forestCreatures addObject:predator];
    }

    return forestCreatures;
}

@end
