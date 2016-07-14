//
//  EVAStudent.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#define DATE(interval) [NSDate dateWithTimeIntervalSinceNow:interval]

#import "EVAStudent.h"

void *EVAStudentContext = &EVAStudentContext;

NSString *const EVAStudentFirstName   = @"firstName";
NSString *const EVAStudentLastName    = @"lastName";
NSString *const EVAStudentDateOfBirth = @"dateOfBirth";
NSString *const EVAStudentGender      = @"gender";
NSString *const EVAStudentGrade       = @"grade";

NSArray *EVAStudentKeyPathes() {
    return @[ EVAStudentFirstName,
              EVAStudentLastName,
              EVAStudentDateOfBirth,
              EVAStudentGender,
              EVAStudentGrade ];
}

NSString *NSStringFromEVAGender(EVAGender g) {
    switch (g) {
        case EVAGenderMale: return @"male";
        case EVAGenderFemale: return @"female";
    }
}

@interface EVAStudent ()

@property (nonatomic, weak) id observer;

@end

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

- (void)dealloc {
    [self addOrRemoveSelfObserverKeyPathes:EVAStudentKeyPathes() shouldRemove:YES];
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public

- (void)clean {
    [self willChangeValueForKey:EVAStudentFirstName];
    _firstName = nil;
    [self didChangeValueForKey:EVAStudentFirstName];
    _lastName = nil;
    _dateOfBirth = nil;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wassign-enum"
    _gender = NSUIntegerMax;
#pragma clang diagnostic pop
    _grade = 0.f;
}

- (void)registerObserver:(id)observer {
    if (self.observer) {
        [self addOrRemoveSelfObserverKeyPathes:EVAStudentKeyPathes() shouldRemove:YES];
    }
    
    self.observer = observer;
    
    [self addOrRemoveSelfObserverKeyPathes:EVAStudentKeyPathes() shouldRemove:NO];
}

#pragma mark - Private

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"\n"
            "first name: %@\n"
            "last name: %@\n"
            "date of birth: %@\n"
            "gender: %@\n"
            "grade: %.2f", self.firstName, self.lastName, self.dateOfBirth, NSStringFromEVAGender(self.gender), (double)self.grade];
}

- (void)addOrRemoveSelfObserverKeyPathes:(NSArray <NSString *>*)keyPathes shouldRemove:(BOOL)shouldRemove {
    NSKeyValueObservingOptions options =
    (
     NSKeyValueObservingOptionNew
     |
     NSKeyValueObservingOptionOld
     |
     NSKeyValueObservingOptionInitial
     |
     NSKeyValueObservingOptionPrior
     );
    
    for (NSString *keyPath in keyPathes) {
        if (!shouldRemove) {
            [self addObserver:self.observer forKeyPath:keyPath options:options context:EVAStudentContext];
        } else {
            [self removeObserver:self.observer forKeyPath:keyPath];
        }
    }
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
