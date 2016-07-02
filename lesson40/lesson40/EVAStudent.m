//
//  EVAStudent.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAStudent.h"

NSString *NSStringFromEVAGender(EVAGender g) {
    switch (g) {
        case EVAGenderMale: return @"male";
        case EVAGenderFemale: return @"female";
    }
}

@implementation EVAStudent

#pragma mark - Life cycle

+ (instancetype)createStudentFirstName:(NSString *)firstName
                              lastName:(NSString *)lastName
                           dateOfBirth:(NSDate *)dateOfBirth
                                gender:(EVAGender)gender
                                 grade:(CGFloat)grade {
    EVAStudent *student = [[EVAStudent alloc] init];
    student.firstName = firstName;
    student.lastName = lastName;
    student.dateOfBirth = dateOfBirth;
    student.gender = gender;
    student.grade = grade;
    
    return student;
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public

#pragma mark - Private

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"\n"
            "first name: %@\n"
            "last name: %@\n"
            "date of birth: %@\n"
            "gender: %@\n"
            "grade: %.2f", self.firstName, self.lastName, self.dateOfBirth, NSStringFromEVAGender(self.gender), (double)self.grade];
}

#pragma mark - Segue
#pragma mark - Animations
#pragma mark - Protocol conformance
#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
