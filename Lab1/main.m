
#import <Foundation/Foundation.h>
#import "Forest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [Forest.instance simulate];
        NSLog(@"And at the end of simulate forest has:\n %@", [Forest.instance creatures]);
    }

    return 0;
}
