#import <Foundation/Foundation.h>

@interface Forest : NSObject

@property NSMutableSet *creatures;
@property NSNumber *day;

+(id) instance;

+(id) alloc __attribute__ ((unavailable("alloc not available, call instance")));
+(id) init __attribute__ ((unavailable("init not available, call instance")));
+(id) new __attribute__ ((unavailable("new not available, call instance")));

-(void)simulate;

@end