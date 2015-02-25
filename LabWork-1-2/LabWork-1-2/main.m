#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
#import "HeadOfTheChair.h"
#import "DepartmentOfUniversity.h"
#import "University.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Initialize students
        NSArray *students = @[
                             [[Student alloc] initWithName:@"Ivan" age:@16 gradePointAverage:@4.3],
                             [[Student alloc] initWithName:@"Petr" age:@17 gradePointAverage:@3.4],
                             [[Student alloc] initWithName:@"Ibragim" age:@18 gradePointAverage:@4.5],
                             [[Student alloc] initWithName:@"Igor" age:@17 gradePointAverage:@3.7],
                             [[Student alloc] initWithName:@"Andrey" age:@17 gradePointAverage:@4.8],
                             [[Student alloc] initWithName:@"Svetlana" age:@16 gradePointAverage:@4.0],
                             [[Student alloc] initWithName:@"Elena" age:@17 gradePointAverage:@4.1],
                             [[Student alloc] initWithName:@"Olesya" age:@18 gradePointAverage:@4.7],
                             [[Student alloc] initWithName:@"Olya" age:@17 gradePointAverage:@3.9],
                             [[Student alloc] initWithName:@"Snezhana" age:@17 gradePointAverage:@4.6]
        ];
        
        // Initialize teacher
        NSArray *teachers = @[
                             [[Teacher alloc] initWithName:@"Igor Andreevich" age:@57 salary:@50000],
                             [[Teacher alloc] initWithName:@"Petr Petrovich" age:@36 salary:@40000],
                             [[Teacher alloc] initWithName:@"Zurab Konstantinovich" age:@48 salary:@45000]
        ];
        
        // Initialize head of the chair
        HeadOfTheChair *head = [[HeadOfTheChair alloc] initWithName:@"Vladimir Vladimirovich" age:@55 salary:@70000];
        
        // Initialize some relations between participants of educational process
        [head addInferior:teachers[0]];
        [head addStudent:students[0]];
        [students[1] addSuperior:head];
        [teachers[1] addSuperior:head];
        [teachers[0] addStudent:students[0]];
        [teachers[0] addStudent:students[1]];
        [teachers[0] addStudent:students[2]];
        [teachers[1] addStudent:students[1]];
        [teachers[1] addStudent:students[2]];
        [teachers[1] addStudent:students[3]];
        [students[4] addSuperior:teachers[0]];
        [students[5] addSuperior:teachers[1]];
        [students[6] addSuperior:teachers[1]];
        
        // Output the result
        NSLog(@"All the created entities:\n%@\n%@\n%@", students, teachers, head);
        
        // Initialize department of university and add some entities to it
        DepartmentOfUniversity *department = [[DepartmentOfUniversity alloc] initWithName:@"Programming and IT Technologies"];
        [department assignHeadOfTheChair:head];
        [department addTeacher:teachers[0]];
        [department addTeacher:teachers[1]];
        [department addStudent:students[0]];
        [department addStudent:students[1]];
        [department addStudent:students[2]];
        [department addStudent:students[3]];
        [department addStudent:students[4]];
        [department addStudent:students[5]];
        [department addStudent:students[6]];
        
        // Output avarage GPA of the department
        NSLog(@"Avarage GPA of the department: %0.2f", department.avarageGPA);
        
        // Change GPA of one of the department's students and output updated value of avarage GPA of the department
        [students[0] setGradePointAverage:@5.0];
        NSLog(@"Updated avarage GPA of the department: %0.2f", department.avarageGPA);
        
        // Initialize the university and output all it's participants
        University *university = [University sharedInstance];
        NSLog(@"University participants:\n%@\n%@\n%@", [university students], [university teachers], [university headsOfTheChairs]);

    }
    return 0;
}
