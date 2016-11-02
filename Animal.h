#import <Foundation/Foundation.h>
#import "Creature.h"
#import "Names.h"
#import "Defense.h"


@interface Animal : Creature <Names, Defense> {
    NSMutableArray *_stomach;
}

-(void) eatsAn:(Creature*)food;
-(NSString *) showStomach: (NSString *)tab;

@end