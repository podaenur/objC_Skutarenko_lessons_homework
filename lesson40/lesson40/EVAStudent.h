//
//  EVAStudent.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

@import Foundation;
@import UIKit;

extern void *EVAStudentContext;

extern NSString *const EVAStudentFirstName;
extern NSString *const EVAStudentLastName;
extern NSString *const EVAStudentDateOfBirth;
extern NSString *const EVAStudentGender;
extern NSString *const EVAStudentGrade;

typedef NS_ENUM(NSUInteger, EVAGender) {
    EVAGenderMale,
    EVAGenderFemale
};

@interface EVAStudent : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic, assign) EVAGender gender;
@property (nonatomic, assign) CGFloat grade;

+ (instancetype)createStudentFirstName:(NSString *)firstName
                              lastName:(NSString *)lastName
                           dateOfBirth:(NSDate *)dateOfBirth
                                gender:(EVAGender)gender
                                 grade:(CGFloat)grade;

- (void)clean;
- (void)registerObserver:(id)observer;

@end
