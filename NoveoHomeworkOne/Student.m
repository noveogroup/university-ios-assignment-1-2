//
//  Student.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize degree = _degree, universityName = _universityName, departmentName = _departmentName, averagePoints = _averagePoints, lecturerList = _lecturerList, chief = _chief;

NSString *const kStringStudentDegree = @"Student";

#pragma mark -
#pragma mark Initializers

- (id) initStudentWith:(NSString *)firstName :(NSString *)lastName :(NSString *)nickName :(NSNumber *)age :(NSNumber *)gender :(NSString *)university :(NSString *)department :(NSNumber *)averagePoints {
    if (self = [super initWith:firstName :lastName :nickName :age :gender]) {
        _universityName = university;
        _departmentName = department;
        _averagePoints = [NSNumber numberWithInt:[averagePoints intValue]];
        _lecturerList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}
    
- (id) init {
    if (self = [super init]) {
        _universityName = @"Unknown University";
        _departmentName = @"Unknown Department";
        _averagePoints = [NSNumber numberWithInt:0];
        _lecturerList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

#pragma mark -
#pragma mark Protocol EducationMember Implementation
    
    - (void) setChief:(id)chief {
        if (_chief) {
            [_chief removeFromSubordunateList:self];
        }
        _chief = chief;
    }

    - (id) getChief {
        return _chief;
    }

- (void) setSubordinatesList:(NSArray *)subordinateList{
    NSLog(@"Adding subordinate list error: Student can't have a subordinates");
}

- (NSArray *) getSubordinatesList{
    // NSLog(@"Getting subordinate list error: Student can't have a subordinates");
    return nil;
    
}

- (void) addSubordinate:(id)subordinate{
    NSLog(@"Adding subordinate error: Student can't have a subordinates");
}

- (void) removeFromSubordunateList:(id)member {
    NSLog(@"Removing subordinate list error: Student can't have a subordinates");
}

- (void) removeChief {
    [self setChief:nil];
}
    

@end
