#import "PlaceOfEducationalProcess.h"
#import "University.h"

static id<PlaceOfEducationalProcess> _placeDelegate = nil;

@implementation PlaceOfEducationalProcess

- (void)addParticipant:(id)participant {
    [_placeDelegate addParticipant:participant];
}

- (void)removeParticipant:(id)participant {
    [_placeDelegate removeParticipant:participant];
}

- (instancetype)init {
    if (_placeDelegate == nil) {
        // Set placeDelegate to University by default or you can manually adjust it by 'setPlaceDelegate' method
        _placeDelegate = [University sharedInstance];
    }
    return self;
}

+ (void)setPlaceDelegate:(id<PlaceOfEducationalProcess>)placeDelegate {
    _placeDelegate = placeDelegate;
}

@end