//
//  Rector.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Human.h"
#import "UniversityEmployee.h"



@interface Rector : Human <UniversityEmployee>

@property (copy, nonatomic) NSArray *subordinates;
@property (assign, nonatomic) NSInteger salary;
@property (copy, nonatomic) NSString *type;


@end
