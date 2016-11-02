#import "Animal.h"


@implementation Animal

@synthesize name;

-(void)eatsAn:(Creature*)food{}

-(NSString *)showStomach: (NSString *)tab {
    NSString *str = [NSString stringWithFormat:@"%@%@: \n", tab, self.name];
    tab = [NSString stringWithFormat:@"%@   ", tab];

    if (_stomach.count == 0){
        str = [NSString stringWithFormat:@"%@%@Empty\n", str, tab];
    } else {
        for (Creature *item in _stomach) {
            if ([item isKindOfClass:[Animal class]]) {
                str = [NSString stringWithFormat:@"%@%@", str,[(Animal *) item showStomach:tab]];
            } else {
                str = [NSString stringWithFormat:@"%@%@%@\n", str, tab, item.description];
            }
        }
    }
    return str;
}

@end