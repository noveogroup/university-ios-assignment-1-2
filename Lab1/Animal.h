#import <Foundation/Foundation.h>
#import "Creature.h"
#import "Names.h"


@interface Animal : Creature <Names> {
    NSMutableArray *_stomach;
}

-(void) eatsAn:(Creature*)food;
-(NSString *) showStomach: (NSString *)tab;

@end