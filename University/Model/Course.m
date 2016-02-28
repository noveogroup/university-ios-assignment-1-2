//
//  Course.m
//  University
//
//  Created by Oleg Sannikov on 2/21/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Course.h"
#import "Student.h"

static void * ParticipantsKVOContext = &ParticipantsKVOContext;

@interface Course (){
    NSMutableSet<Student *> *_participants;
}
@property (nonatomic, readwrite) float meanGrade;

@end

@implementation Course
#pragma mark - Lifecycle
- (instancetype)init{
    self = [self init];
    if (self) {
    }
    
    return self;
}

+ (instancetype)courseWithName:(NSString *)name andTeacher:(Teacher *)teacher{
    return [[self alloc] initWithName:name andTeacher:teacher];
}

- (instancetype)initWithName:(NSString *)name andTeacher:(Teacher *)teacher{
    self = [super init];
    if (self) {
        _name = name;
        _teacher = teacher;
        _participants = [NSMutableSet new];
    }
    
    return self;
}


#pragma mark - Accessors
- (NSSet<Student *> *)participants{
    return _participants;
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rName: %@", self.name]];
}

- (void)addParticipant:(Student *)participant{
    [_participants addObject:participant];
    [participant singUpForCourse:self];
    [participant addObserver:self forKeyPath:@"meanGrade" options:NSKeyValueObservingOptionNew context:ParticipantsKVOContext];
    [self recalculateMeanGrade];
}

- (void)addParticipants:(NSArray<Student *> *)participants{
    for (Student * participant in participants) {
        [self addParticipant:participant];
    }
}


#pragma mark - Private
- (void)recalculateMeanGrade{
    float meanGrade;
    for (Student * student in _participants) {
        meanGrade += student.meanGrade;
    }
    
    self.meanGrade = meanGrade/_participants.count;
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (context == ParticipantsKVOContext) {
        if ([object isKindOfClass:[Student class]]) {
            if ([keyPath isEqualToString:@"meanGrade"]) {
                [self recalculateMeanGrade];
            }
        }
    }
}

@end
