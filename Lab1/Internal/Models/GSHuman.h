
#import <Foundation/Foundation.h>


@interface GSHuman : NSObject 

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age;

//- (NSString *)description;

@end
