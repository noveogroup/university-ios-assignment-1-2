//
//  UniversityEmployee.h
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Employee.h"
#import "EducationalProcessParticipant.h"

@class Department;

@interface UniversityEmployee : Employee <EducationalProcessParticipant>
@property (weak, nonatomic) Department *department;

@end
