#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
#import "HeadOfTheChair.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Initialize students
        NSArray *students = [NSArray arrayWithObjects:
                             [[Student alloc] initWithName:@"Ivan" age:@16 gradePointAverage:@4.3],
                             [[Student alloc] initWithName:@"Petr" age:@17 gradePointAverage:@3.4],
                             [[Student alloc] initWithName:@"Ibragim" age:@18 gradePointAverage:@4.5],
                             [[Student alloc] initWithName:@"Igor" age:@17 gradePointAverage:@3.7],
                             [[Student alloc] initWithName:@"Andrey" age:@17 gradePointAverage:@4.8],
                             [[Student alloc] initWithName:@"Svetlana" age:@16 gradePointAverage:@4.0],
                             [[Student alloc] initWithName:@"Elena" age:@17 gradePointAverage:@4.1],
                             [[Student alloc] initWithName:@"Olesya" age:@18 gradePointAverage:@4.7],
                             [[Student alloc] initWithName:@"Olya" age:@17 gradePointAverage:@3.9],
                             [[Student alloc] initWithName:@"Snezhana" age:@17 gradePointAverage:@4.6],
                             nil];
        
        // Initialize teacher
        NSArray *teachers = [NSArray arrayWithObjects:
                             [[Teacher alloc] initWithName:@"Igor Andreevich" age:@57 salary:@50000],
                             [[Teacher alloc] initWithName:@"Petr Petrovich" age:@36 salary:@40000],
                             [[Teacher alloc] initWithName:@"Zurab Konstantinovich" age:@48 salary:@45000],
                             nil];
        
        // Initialize head of the chair
        HeadOfTheChair *head = [[HeadOfTheChair alloc] initWithName:@"Vladimir Vladimirovich" age:@55 salary:@70000];
        
        // Initialize some relations between participants of educational process
        [head addInferior:[teachers objectAtIndex:0]];
        [[teachers objectAtIndex:1] addSuperior:head];
        [[teachers objectAtIndex:0] addInferior:[students objectAtIndex:0]];
        [[teachers objectAtIndex:0] addInferior:[students objectAtIndex:1]];
        [[teachers objectAtIndex:0] addInferior:[students objectAtIndex:2]];
        [[teachers objectAtIndex:1] addInferior:[students objectAtIndex:1]];
        [[teachers objectAtIndex:1] addInferior:[students objectAtIndex:2]];
        [[teachers objectAtIndex:1] addInferior:[students objectAtIndex:3]];
        [[students objectAtIndex:4] addSuperior:[teachers objectAtIndex:0]];
        [[students objectAtIndex:5] addSuperior:[teachers objectAtIndex:1]];
        [[students objectAtIndex:6] addSuperior:[teachers objectAtIndex:1]];

        // Output the result
        NSLog(@"%@\n%@\n%@", students, teachers, head);
        
    }
    return 0;
}
